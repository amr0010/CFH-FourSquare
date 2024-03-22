//
//  LocalStorageService.swift
//  CFH-TechTask-AmrMagdy
//
//  Created by Amr Magdy on 22/03/2024.
//

import Foundation

class LocalStorageService {
    private let userDefaults: UserDefaults = .standard

    func saveUser(user: UserDTO) {
        if let encoded = try? JSONEncoder().encode(user) {
            userDefaults.set(encoded, forKey: "currentUser")
        }
    }

    func getCurrentUser() -> UserDTO? {
        if let userData = userDefaults.data(forKey: "currentUser"),
           let user = try? JSONDecoder().decode(UserDTO.self, from: userData) {
            return user
        }
        return nil
    }
    
    func removeCurrentUser() {
           userDefaults.removeObject(forKey: "currentUser")
       }
}
