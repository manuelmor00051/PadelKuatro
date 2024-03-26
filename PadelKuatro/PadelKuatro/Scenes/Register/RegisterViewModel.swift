//
//  RegisterViewModel.swift
//  PadelKuatro
//
//  Created by manuel.moreno.local on 6/3/24.
//

import SwiftUI
import FirebaseAuth

class RegisterViewModel: BaseViewModel<MainCoordinatorProtocol>, ObservableObject {

    @Published var email: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    @Published var showLoginAlert: Bool = false
    @Published var alert: LogInAlertType?

    func registerUser() {
        if !email.isEmail {
            alert = .wrongEmail
            showLoginAlert = true
        } else {
            if password == confirmPassword && password.count > Constants.Defaults.passwordLength {
                Auth.auth().createUser(withEmail: email, password: password) { [weak self] (result, error) in
                    if let _ = result, error == nil {
                        self?.alert = .successSingUp
                        self?.showLoginAlert = true
                    } else {
                        self?.alert = .wrongSignUp
                        self?.showLoginAlert = true
                    }
                }
            } else {
                alert = .notMatchPassword
                showLoginAlert = true
            }
        }
    }

    func navigateToLogin() {
        getCoordinator()?.navigateToLogin()
    }
}
