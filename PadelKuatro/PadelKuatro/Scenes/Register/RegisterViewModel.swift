//
//  RegisterViewModel.swift
//  PadelKuatro
//
//  Created by manuel.moreno.local on 6/3/24.
//

import SwiftUI

class RegisterViewModel: BaseViewModel<MainCoordinatorProtocol>, ObservableObject {

    @Published var email: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""

    func navigateToLogin() {
        getCoordinator()?.navigateToLogin()
    }
}
