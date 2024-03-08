//
//  LoginViewModel.swift
//  PadelKuatro
//
//  Created by manuel.moreno.local on 24/2/24.
//

import SwiftUI

class LoginViewModel: BaseViewModel<MainCoordinatorProtocol>, ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""

    func navigateToRegister() {
        getCoordinator()?.navigateToRegister()
    }
}
