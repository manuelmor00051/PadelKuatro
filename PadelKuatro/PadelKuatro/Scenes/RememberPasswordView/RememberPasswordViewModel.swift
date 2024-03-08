//
//  RememberPasswordViewModel.swift
//  PadelKuatro
//
//  Created by manuel.moreno.local on 8/3/24.
//

import SwiftUI

class RememberPasswordViewModel: BaseViewModel<MainCoordinatorProtocol>, ObservableObject {

    func rememberPassword() {
        // TODO: - Remember Password service call
    }

    func navigatetToLoging() {
        getCoordinator()?.navigateToLogin()
    }
}

