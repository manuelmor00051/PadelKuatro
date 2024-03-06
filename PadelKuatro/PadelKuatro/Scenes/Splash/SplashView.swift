//
//  SwiftUIView.swift
//  PadelKuatro
//
//  Created by manuel.moreno.local on 23/2/24.
//

import SwiftUI

struct SplashView: View {
    @ObservedObject var viewModel: SplashViewModel

    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.white)
                .ignoresSafeArea()
            Image(.splash)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .ignoresSafeArea()
        }
        .onAppear {
            viewModel.onAppear()
        }
    }
}

#Preview {
    SplashView(viewModel: SplashViewModel(coordinator: MainCoordinator()))
}
