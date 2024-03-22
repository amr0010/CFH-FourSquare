//
//  ProfileViewModel.swift
//  CFH-TechTask-AmrMagdy
//
//  Created by Amr Magdy on 22/03/2024.
//

import Foundation
import Combine

class ProfileViewModel: ObservableObject {
    @Published var user: UserDTO?
    private var cancellables = Set<AnyCancellable>()

    func fetchCurrentUser() {
             if let userData = UserDefaults.standard.data(forKey: "currentUser") {
            let decoder = JSONDecoder()
            if let decodedUser = try? decoder.decode(UserDTO.self, from: userData) {
                self.user = decodedUser
            }
        }
    }
}
