//
//  LoginViewModel.swift
//  PadelKuatro
//
//  Created by manuel.moreno.local on 24/2/24.
//

import SwiftUI
import FirebaseAuth

class LoginViewModel: BaseViewModel<MainCoordinatorProtocol>, ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var showAlert = false
    @Published var alertType: LogInAlertType?

    func login() {
        if email.isEmpty || password.isEmpty {
            alertType = .emptyEmailOrPassword
            showAlert = true
        } else if !email.isEmail{
            alertType = .wrongEmail
            showAlert = true
        } else {
            Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
                if let _ = error {
                    self?.alertType = .wronLogIn
                    self?.showAlert = true
                }
                if let user = authResult?.user {
                    if user.isEmailVerified {
                        UserDefaultsManager.saveUserId(user: user.uid)
                        self?.navigateToHome()
                    } else {
                        self?.alertType = .notemailverified
                        self?.showAlert = true
                    }
                }
            }
        }
    }

    private func navigateToHome() {
        self.getCoordinator()?.navigateToHome()
    }

    func sendConfirmationEmail() {
        Auth.auth().currentUser?.sendEmailVerification { [weak self] error in
            if let _ = error {
                self?.alertType = .emailVerificatorError
                self?.showAlert = true
            }
        }}

    func navigateToRegister() {
        getCoordinator()?.navigateToRegister()
    }

    func navigateToRememberPassword() {
        getCoordinator()?.navigateToRememberPassword()
    }
}
