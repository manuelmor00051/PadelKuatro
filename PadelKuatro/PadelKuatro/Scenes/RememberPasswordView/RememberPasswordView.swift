//
//  RememberPasswordView.swift
//  PadelKuatro
//
//  Created by manuel.moreno.local on 8/3/24.
//

import SwiftUI

struct RememberPasswordView: View {

    @ObservedObject var viewModel: RememberPasswordViewModel

    @FocusState private var emailIsFocused: Bool

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
                    Text("rememberPassword_Title")
                        .font(.title)
                        .bold()
                        .foregroundColor(.red)
                }
                Spacer()
                Text("rememberPassword_description")
                    .font(.title3)
                    .padding()
                    .foregroundColor(.white)
                Form {
                    Section{
                        TextField("register_email", text: $viewModel.email)
                    }
                    .focused($emailIsFocused)
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                    .keyboardType(.emailAddress)
                }
                .scrollDisabled(true)
                .scrollContentBackground(.hidden)
                .background(Color.clear.ignoresSafeArea())
                Spacer()
                Button {
                    viewModel.rememberPassword()
                } label: {
                    Text("rememberPassword_resetPassword")
                }
                .buttonStyle(RoundedButton(color: .purple))
                .padding(.bottom, 30)
                .alert(isPresented: $viewModel.showAlert) {
                    ShowAlert().show(alert: viewModel.alertType ?? .notMatchPassword, completion: viewModel.getCoordinator()!.navigateToLogin)
                }
            }
            .onTapGesture {
                emailIsFocused = false
            }
        }
    }
}

#Preview {
    RememberPasswordView(viewModel: RememberPasswordViewModel(coordinator: MainCoordinator()))
}
