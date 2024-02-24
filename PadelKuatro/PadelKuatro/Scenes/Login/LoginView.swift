//
//  LoginView.swift
//  PadelKuatro
//
//  Created by manuel.moreno.local on 24/2/24.
//

import SwiftUI

struct LoginView: View {

    @ObservedObject var viewModel: LoginViewModel

    var body: some View {
        VStack {
            Text("LogIn View")
        }.navigationBarBackButtonHidden()
    }
}

#Preview {
    LoginView(viewModel: LoginViewModel(coordinator: MainCoordinator()))
}
