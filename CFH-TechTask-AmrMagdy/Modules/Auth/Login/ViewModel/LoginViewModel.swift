//
//  LoginViewModel.swift
//  CFH-TechTask-AmrMagdy
//
//  Created by Amr Magdy on 19/03/2024.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var showLoginError = false
    var loginErrorMessage = ""
    private let authService = AuthenticationService(localStorage: LocalStorageService())

    var onLoginSuccess: (() -> Void)?
    
    
    func isInputValid() -> Bool {
        return FieldValidator.isEmailValid(email) && !password.isEmpty
    }

    func login() {
        guard isInputValid() else {
            loginErrorMessage = "Invalid email or empty password"
            showLoginError = true
            return
        }
        if authService.loginUser(email: email, password: password) {
            onLoginSuccess?()
        } else {
            loginErrorMessage = "Invalid email or password"
            showLoginError = true
        }
    }
}
