//
//  HomeView.swift
//  PadelKuatro
//
//  Created by manuel.moreno.local on 27/3/24.
//

import SwiftUI

struct HomeView: View {

    @ObservedObject var viewModel: HomeViewModel

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    HomeView(viewModel: HomeViewModel(coordinator: MainCoordinator()))
}
