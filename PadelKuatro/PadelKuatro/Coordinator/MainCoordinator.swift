//
//  MainCoordinator.swift
//  PadelKuatro
//
//  Created by manuel.moreno.local on 23/2/24.
//

import SwiftUI

protocol MainCoordinatorProtocol: BaseCoordinatorProtocol {
    func navigateToLogin()
    func navigateToRegister()
}

class MainCoordinator: BaseCoordinator, MainCoordinatorProtocol {
    
    // MARK: - Properties

    @Published private(set) var splashViewModel: SplashViewModel!
    @Published private(set) var loginViewModel: LoginViewModel!
    @Published private(set) var registerViewModel: RegisterViewModel!

    @Published var loginIsActive: Bool = false {
        didSet {
            if !loginIsActive {
                loginViewModel = nil
            }
        }
    }

    @Published var registerIsActive: Bool = false {
        didSet {
            if !registerIsActive {
                registerViewModel = nil
            }
        }
    }

    // MARK: Init

    override init() {
        super.init()
        self.navigateToSplash()
    }

    // MARK: - Navigation methods

    func navigateToSplash() {
        splashViewModel = DependencyInjector.shared.getSplashViewModel(coordinator: self)
    }

    func navigateToLogin() {
        loginViewModel = DependencyInjector.shared.getLoginViewModel(coordinator: self)
        loginIsActive = true
        registerIsActive = false
    }

    func navigateToRegister() {
        registerViewModel = DependencyInjector.shared.getRegisterViewModel(coordinator: self)
        registerIsActive = true
        loginIsActive = false
    }
}
