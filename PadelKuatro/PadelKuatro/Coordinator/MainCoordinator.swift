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
    func navigateToRememberPassword()
    func navigateToHome()
}

class MainCoordinator: BaseCoordinator, MainCoordinatorProtocol {
    
    // MARK: - Properties

    @Published private(set) var splashViewModel: SplashViewModel!
    @Published private(set) var loginViewModel: LoginViewModel!
    @Published private(set) var registerViewModel: RegisterViewModel!
    @Published private(set) var rememberPasswordViewModel: RememberPasswordViewModel!
    @Published private(set) var homeViewModel: HomeViewModel!

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

    @Published var rememberPasswordIsActive: Bool = false {
        didSet {
            if !rememberPasswordIsActive {
                rememberPasswordViewModel = nil
            }
        }
    }

    @Published var homeIsAtive: Bool = false {
        didSet {
            if !homeIsAtive {
                homeViewModel = nil
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
        rememberPasswordIsActive = false
        homeIsAtive = false
    }

    func navigateToRegister() {
        registerViewModel = DependencyInjector.shared.getRegisterViewModel(coordinator: self)
        registerIsActive = true
        loginIsActive = false
        rememberPasswordIsActive = false
        homeIsAtive = false
    }

    func navigateToRememberPassword() {
        rememberPasswordViewModel = DependencyInjector.shared.getRememberPasswordViewModel(coordinator: self)
        rememberPasswordIsActive = true
        registerIsActive = false
        loginIsActive = false
        homeIsAtive = false
    }

    func navigateToHome() {
        homeViewModel = DependencyInjector.shared.getHomeViewModel(coordinator: self)
        homeIsAtive = true
        loginIsActive = false
        registerIsActive = false
        rememberPasswordIsActive = false
    }
}
