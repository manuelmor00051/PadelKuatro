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

    @State var termsAccepted: Bool = false

    let screenHeight = UIScreen.main.bounds.height
    let screenwidth = UIScreen.main.bounds.width

    var body: some View {
        NavigationView {
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

                        Text("register_title")
                            .font(.title)
                            .bold()
                            .foregroundColor(.red)
                    }
                    Form {
                        Section{
                            TextField("register_email", text: $viewModel.email)
                        }
                        .focused($emailIsFocused)
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                        .keyboardType(.emailAddress)

                        Section{
                            SecureField("register_password", text: $viewModel.password)
                        }
                        .focused($passwordIsFocused)
                        .autocapitalization(.none)
                        .autocorrectionDisabled()

                        Section{
                            SecureField("register_confirm_password", text: $viewModel.confirmPassword)
                        }
                        .focused($confirmPasswordIsFocused)
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                    }
                    .scrollDisabled(true)
                    .padding(.vertical, 10)
                    .scrollContentBackground(.hidden)
                    .background(Color.clear.ignoresSafeArea())
                    NavigationLink(destination: TermsAndConditions(termsAccepted: $termsAccepted)) {
                        Text("register_terms_and_conditions")
                            .padding()
                            .background(termsAccepted ? Color.gray : Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }.disabled(termsAccepted)

                    Button {
                        viewModel.registerUser()
                    }
                label: {
                    Text("register_register_button_title")
                }
                .disabled(!termsAccepted)
                .buttonStyle(RoundedButton(color: Constants.Colors.purpleButton))
                .padding(.bottom, 20)
                .alert(isPresented: $viewModel.showLoginAlert) {
                    ShowAlert().show(alert: viewModel.alert ?? .notMatchPassword, completion: viewModel.getCoordinator()!.navigateToLogin)
                }
                }
                .onTapGesture {
                    setFocusedFieldsOff()
                }
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
