//
//  RegisterViewModel.swift
//  PadelKuatro
//
//  Created by manuel.moreno.local on 6/3/24.
//

import SwiftUI
import FirebaseAuth
import Firebase

class RegisterViewModel: BaseViewModel<MainCoordinatorProtocol>, ObservableObject {

    @Published var userName: String = ""
    @Published var lastname: String = ""
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
            if checkFields() {
                if password == confirmPassword && password.count > Constants.Defaults.passwordLength {
                    Auth.auth().createUser(withEmail: email, password: password) { [weak self] (result, error) in
                        if let user = result?.user, error == nil {
                            let changeRequest = user.createProfileChangeRequest()
                            guard let userName = self?.userName, let lastname = self?.lastname else { return }
                            changeRequest.displayName = "\(userName.capitalized) \(lastname.capitalized)"
                            changeRequest.commitChanges { (error) in
                                if let _ = error {}
                            }
                            Auth.auth().currentUser?.sendEmailVerification { _ in
                                return
                            }
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
            } else {
                alert = .emptyFields
                showLoginAlert = true
            }
        }
    }

    func termsNotAccepted() {
        alert = .termsNotAccepted
        showLoginAlert = true
    }

    func navigateToLogin() {
        getCoordinator()?.navigateToLogin()
    }

    func checkFields() -> Bool {
        !userName.isEmpty && !lastname.isEmpty && !password.isEmpty && !confirmPassword.isEmpty
    }
}
