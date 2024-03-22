//
//  Publisher+Utils.swift
//  CFH-TechTask-AmrMagdy
//
//  Created by Amr Magdy on 19/03/2024.
//

import Combine

extension Publisher {
    func optionalize() -> Publishers.Map<Self, Self.Output?> {
        map({ Optional.some($0) })
    }
}
