//
//  LoginViewModel.swift
//  SwiftUI+Coordinator
//
//  Created by Alexy Nesterchuk on 11.09.2024.
//

import SwiftUI


final class LoginViewModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var password: String = ""
    
    private let coordinator: Coordinator
    
    init(coordinator: Coordinator) {
        self.coordinator = coordinator
    }
    
    func didSignIn() {
        coordinator.push(.feed)
    }    
}
