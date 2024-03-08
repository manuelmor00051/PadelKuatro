//
//  DependencyInjector.swift
//  PadelKuatro
//
//  Created by manuel.moreno.local on 23/2/24.
//

import Foundation

internal class DependencyInjector {

    static let shared = DependencyInjector()

    func getSplashViewModel(coordinator: MainCoordinatorProtocol) -> SplashViewModel {
        SplashViewModel(coordinator: coordinator)
    }

    func getLoginViewModel(coordinator: MainCoordinatorProtocol) -> LoginViewModel {
        LoginViewModel(coordinator: coordinator)
    }

    func getRegisterViewModel(coordinator: MainCoordinatorProtocol) -> RegisterViewModel {
        RegisterViewModel(coordinator: coordinator)
    }

    func getRememberPasswordViewModel(coordinator: MainCoordinatorProtocol) -> RememberPasswordViewModel {
        RememberPasswordViewModel(coordinator: coordinator)
    }
}
