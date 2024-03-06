//
//  RegisterView.swift
//  PadelKuatro
//
//  Created by manuel.moreno.local on 6/3/24.
//

import SwiftUI

struct RegisterView: View {

    @ObservedObject var viewModel: RegisterViewModel

    @FocusState private var emailIsFocused: Bool
    @FocusState private var passwordIsFocused: Bool
    @FocusState private var confirmPasswordIsFocused: Bool

    let screenHeight = UIScreen.main.bounds.height
    let screenwidth = UIScreen.main.bounds.width

    var body: some View {
        ZStack {
            Rectangle()
                .fill(.black)
                .ignoresSafeArea()
                .opacity(0.8)
            VStack {
                HStack {
                    Button {
                        viewModel.navigateToLogin()
                    } label: {
                        Image(systemName: "chevron.left")
                    }.padding(.leading, screenwidth / -5)

                    Text("register_title".localized)
                        .font(.title)
                        .bold()
                        .foregroundColor(.red)
                }
                Form {
                    Section{
                        TextField("register_email".localized, text: $viewModel.email)
                    }
                    .focused($emailIsFocused)
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                    .keyboardType(.emailAddress)
                    
                    Section{
                        TextField("register_password".localized, text: $viewModel.password)
                    }
                    .focused($passwordIsFocused)
                    .autocapitalization(.none)
                    .autocorrectionDisabled()

                    Section{
                        TextField("register_confirm_password".localized, text: $viewModel.confirmPassword)
                    }
                    .focused($confirmPasswordIsFocused)
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                }
                .scrollDisabled(true)
                .padding(.vertical, 10)
                .scrollContentBackground(.hidden)
                .background(Color.clear.ignoresSafeArea())
                Button {

                }
                label: {
                    Text("register_register_button_title".localized)
                }
                .buttonStyle(RoundedButton(color: Constants.Colors.purpleButton))
                .padding(.bottom, 20)
            }.onTapGesture {
                setFocusedFieldsOff()
            }
        }
    }

    func setFocusedFieldsOff() {
        emailIsFocused = false
        passwordIsFocused = false
        confirmPasswordIsFocused = false
    }
}

#Preview {
    RegisterView(viewModel: RegisterViewModel(coordinator: MainCoordinator()))
}
