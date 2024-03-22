//
//  SettingsViewModel.swift
//  CFH-TechTask-AmrMagdy
//
//  Created by Amr Magdy on 22/03/2024.
//

import Foundation

class SettingsViewModel: ObservableObject {
    
    private let authService = AuthenticationService(localStorage: LocalStorageService())
    var onLogoutSuccess: (() -> Void)?

    func logoutUser() {
    }
}
