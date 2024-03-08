//
//  MainCoordinatorView.swift
//  PadelKuatro
//
//  Created by manuel.moreno.local on 23/2/24.
//

import SwiftUI

struct MainCoordinatorView: View {
    
    // MARK: - Properties
    
    @ObservedObject var coordinator: MainCoordinator
    
    // MARK: - Body
    
    var body: some View {
        if coordinator.registerIsActive {
            getRegisterView()
        } else if coordinator.loginIsActive {
            getLoginView()
        } else if coordinator.rememberPasswordIsActive {
            getRememberPasswordView()
        } else {
            getSplashView()
        }
    }
    
    func getSplashView() -> some View {
        NavigationView {
            SplashView(viewModel: coordinator.splashViewModel)
                .navigation(isActive: $coordinator.loginIsActive) {
                    getLoginView()
                }
        }
    }

    func getLoginView() -> some View {
        LoginView(viewModel: coordinator.loginViewModel)
    }

    func getRegisterView() -> some View {
        RegisterView(viewModel: coordinator.registerViewModel)
    }

    func getRememberPasswordView() -> some View {
        RememberPasswordView(viewModel: coordinator.rememberPasswordViewModel)
    }
}

