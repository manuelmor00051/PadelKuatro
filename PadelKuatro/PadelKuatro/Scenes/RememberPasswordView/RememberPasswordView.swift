//
//  RememberPasswordView.swift
//  PadelKuatro
//
//  Created by manuel.moreno.local on 8/3/24.
//

import SwiftUI

struct RememberPasswordView: View {

    @ObservedObject var viewModel: RememberPasswordViewModel

    private let screenWidth = UIScreen.main.bounds.width

    var body: some View {
        ZStack {
            Rectangle()
                .fill(.black)
                .ignoresSafeArea()
                .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
            VStack() {
                HStack {
                    Button {
                        viewModel.navigatetToLoging()
                    } label: {
                        Image(systemName: "chevron.left")
                    }
                    .padding(.leading, -30)
                    Text("Recuperar Contraseña")
                        .font(.title)
                        .bold()
                        .foregroundColor(.red)
                }
                Spacer()
                Text("rememberPassword_description".localized)
                    .font(.title3)
                    .padding()
                    .foregroundColor(.white)
                Spacer()
                Button {
                    viewModel.rememberPassword()
                } label: {
                    Text("Restablecer contraseña")
                }
                .buttonStyle(RoundedButton(color: .purple))
                .padding(.bottom, 30)
            }
        }
    }
}

#Preview {
    RememberPasswordView(viewModel: RememberPasswordViewModel(coordinator: MainCoordinator()))
}
