//
//  RememberPasswordViewModel.swift
//  PadelKuatro
//
//  Created by manuel.moreno.local on 8/3/24.
//

import SwiftUI
import Firebase

class RememberPasswordViewModel: BaseViewModel<MainCoordinatorProtocol>, ObservableObject {

    @Published var email: String = ""
    @Published var showAlert: Bool = false
    @Published var alertType: LogInAlertType?

    func rememberPassword() {
        if email.isEmail {
            /*Auth.auth().fetchSignInMethods(forEmail: email) { [weak self] (signInMethods, error) in
                guard let self else { return }
                if let _ = error {
                    self.alertType = .rememberPasswordError
                    self.showAlert = true
                    return
                }
                if let signInMethods = signInMethods {
                    if signInMethods.isEmpty {
                        self.alertType = .notAnUser
                        self.showAlert = true
                    } else {*/
                        Auth.auth().sendPasswordReset(withEmail: self.email) { error in
                            if let _ = error {
                                self.alertType = .rememberPasswordError
                                self.showAlert = true
                            } else {
                                self.alertType = .successRememberPassword
                                self.showAlert = true
                            }
                        }
                    //}
                //}
            //}
        } else {
            alertType = .wrongEmail
            showAlert = true
        }
    }

    func navigatetToLoging() {
        getCoordinator()?.navigateToLogin()
    }
}

