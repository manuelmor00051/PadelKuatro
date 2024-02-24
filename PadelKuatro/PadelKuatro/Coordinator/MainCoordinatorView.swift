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
        getSplashView()
    }

    func getSplashView() -> some View {
        NavigationView {
            SplashView(viewModel: coordinator.splashViewModel)
        }
    }
}

