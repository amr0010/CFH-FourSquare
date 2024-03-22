//
//  AuthenticationService.swift
//  CFH-TechTask-AmrMagdy
//
//  Created by Amr Magdy on 22/03/2024.
//

import Foundation

class AuthenticationService {
    private let localStorage: LocalStorageService

    init(localStorage: LocalStorageService) {
        self.localStorage = localStorage
    }

    func registerUser(user: UserDTO) {
        localStorage.saveUser(user: user)
    }

    func loginUser(email: String, password: String) -> Bool {
        guard let existingUser = localStorage.getCurrentUser() else {
            return false
        }

        return existingUser.email == email && existingUser.password == password
    }
    func logoutUser() {
          localStorage.removeCurrentUser()
      }
}
