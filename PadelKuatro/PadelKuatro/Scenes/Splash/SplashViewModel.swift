//
//  SplashViewModel.swift
//  PadelKuatro
//
//  Created by manuel.moreno.local on 23/2/24.
//

import SwiftUI

class SplashViewModel: BaseViewModel<MainCoordinatorProtocol>, ObservableObject {
    
    func onAppear() {
        DispatchQueue.main.asyncAfter(deadline: .now() + Constants.Defaults.splashTimer) { [weak self] in
            self?.getCoordinator()?.navigateToLogin()
        }
    }
}
