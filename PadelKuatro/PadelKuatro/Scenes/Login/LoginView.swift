//
//  LoginView.swift
//  PadelKuatro
//
//  Created by manuel.moreno.local on 24/2/24.
//

import SwiftUI

struct LoginView: View {

    @ObservedObject var viewModel: LoginViewModel
    @FocusState private var emailIsFocused: Bool
    @FocusState private var passwordIsFocused: Bool

    let screenHeight = UIScreen.main.bounds.height
    let screenWidth = UIScreen.main.bounds.width

    private var anyIsFocused: Bool {
        if emailIsFocused || passwordIsFocused {
            true
        } else {
            false
        }
    }

    var body: some View {
        VStack(spacing: 70) {
            Spacer()
            Text("login_title".localized)
                .font(.title)
                .bold()
                .foregroundColor(.red)
            VStack {
                Form {
                    Section() {
                        TextField(text: $viewModel.email, prompt: Text("login_email".localized)) {
                            Text("login_email".localized)
                        }
                        .focused($emailIsFocused)
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                        .keyboardType(.emailAddress)
                    }
                    Section() {
                        SecureField(text: $viewModel.password, prompt: Text("login_password".localized)){
                            Text("login_password".localized)
                        }
                        .focused($passwordIsFocused)
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                    }
                }
                .scrollDisabled(true)
                .padding(.vertical, 10)
                .scrollContentBackground(.hidden)
                .background(Color.clear.ignoresSafeArea())
                if !anyIsFocused {
                    Button("login_button_title".localized) {
                        viewModel.login()
                    }
                    .buttonStyle(RoundedButton(color: Constants.Colors.purpleButton))
                    .alert(isPresented: $viewModel.showAlert, content: {
                        ShowAlert().show(alert: viewModel.alertType ?? .notAnUser, completion: viewModel.alertType == .notemailverified ? viewModel.sendConfirmationEmail : nil)
                    })
                    Button("login_register_button_title".localized) {
                        viewModel.navigateToRegister()
                    }
                    .buttonStyle(RoundedButton(color: Color.red))
                    Button {
                        viewModel.navigateToRememberPassword()
                    } label: {
                        Text("login_remember_password".localized)
                            .fontWeight(.bold)
                    }
                }
            }
        }
        .onTapGesture {
            setFocusedOff()
        }
        .background(
            ZStack {
                Image(.ground)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
                    .offset(x: Constants.Defaults.loginImageOffset, y: .zero)
                Rectangle()
                    .fill(Color.black)
                    .opacity(0.3)
                    .ignoresSafeArea()
            }.onTapGesture {
                setFocusedOff()
            }
        )
        .navigationBarBackButtonHidden()
    }

    private func setFocusedOff() {
        emailIsFocused = false
        passwordIsFocused = false
    }
}

#Preview {
    LoginView(viewModel: LoginViewModel(coordinator: MainCoordinator()))
}
