//
//  RegistrationViewModel.swift
//  CFH-TechTask-AmrMagdy
//
//  Created by Amr Magdy on 19/03/2024.
//

import Foundation

class RegistrationViewModel: ObservableObject {
    @Published var firstName = ""
    @Published var lastName = ""
    @Published var age = ""
    @Published var email = ""
    @Published var password = ""
    @Published var confirmPassword = ""
    
    private let authService = AuthenticationService(localStorage: LocalStorageService())
    var onSignUpSuccess: (() -> Void)?

    func isInputValid() -> Bool {
        return FieldValidator.isAgeValid(age) &&
               !firstName.isEmpty &&
               !lastName.isEmpty &&
               FieldValidator.isEmailValid(email) &&
               FieldValidator.isPasswordValid(password) &&
               FieldValidator.doPasswordsMatch(password, confirmPassword)
    }

    func register() {
        let user = UserDTO(firstName: firstName, lastName: lastName, age: age, email: email, password: password)
        authService.registerUser(user: user)
        onSignUpSuccess?()
    }
}
