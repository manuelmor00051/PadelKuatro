//
//  MainCoordinator.swift
//  PadelKuatro
//
//  Created by manuel.moreno.local on 23/2/24.
//

import SwiftUI

protocol MainCoordinatorProtocol: BaseCoordinatorProtocol {

}

class MainCoordinator: BaseCoordinator, MainCoordinatorProtocol {
    
    // MARK: - Properties

    @Published private(set) var splashViewModel: SplashViewModel!

    // MARK: Init

    override init() {
        super.init()
        self.navigateToSplash()
    }

    // MARK: - Navigation methods

    func navigateToSplash() {
        splashViewModel = DependencyInjector.shared.getSplashViewModel(coordinator: self)
    }
}
