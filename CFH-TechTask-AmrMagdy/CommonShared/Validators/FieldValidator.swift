//
//  FieldValidator.swift
//  CFH-TechTask-AmrMagdy
//
//  Created by Amr Magdy on 19/03/2024.
//

import Foundation

class FieldValidator {
    static func isAgeValid(_ age: String) -> Bool {
        if let ageInt = Int(age), ageInt >= 18 {
            return true
        }
        return false
    }

    static func isEmailValid(_ email: String) -> Bool {
        return email.contains("@") && email.contains(".")
    }

    static func isPasswordValid(_ password: String) -> Bool {
        return password.count >= 8 && password.containsSpecialCharacter && password.containsNumber
    }

    static func doPasswordsMatch(_ password: String, _ confirmPassword: String) -> Bool {
        return password == confirmPassword
    }
}

extension String {
    var containsSpecialCharacter: Bool {
        let regex = ".*[^A-Za-z0-9].*"
        return NSPredicate(format:"SELF MATCHES %@", regex).evaluate(with: self)
    }

    var containsNumber: Bool {
        let regex = ".*[0-9]+.*"
        return NSPredicate(format:"SELF MATCHES %@", regex).evaluate(with: self)
    }
}
