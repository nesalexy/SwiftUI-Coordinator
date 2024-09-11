//
//  LoginView.swift
//  SwiftUI+Coordinator
//
//  Created by Alexy Nesterchuk on 11.09.2024.
//

import SwiftUI

struct LoginView: View {
    
    @ObservedObject var viewModel: LoginViewModel
    
    var body: some View {
        VStack {
            TextField("email", text: $viewModel.email)
            TextField("password", text: $viewModel.password)
            Button {
                viewModel.didSignIn()
            } label: {
                Text("Sign In")
            }
        }
    }
}

#Preview {
    LoginView(viewModel: LoginViewModel(coordinator: Coordinator()))
}
