//
//  CFH_TechTask_AmrMagdyApp.swift
//  CFH-TechTask-AmrMagdy
//
//  Created by Amr Magdy on 19/03/2024.
//

import SwiftUI

@main
struct CFH_TechTask_AmrMagdyApp: App {
    @StateObject private var locationManager = LocationManager()

    var body: some Scene {
        WindowGroup {
            NavigationView {
                OnboardingView()
                   
            }
            .environmentObject(locationManager)
        }
    }
}
