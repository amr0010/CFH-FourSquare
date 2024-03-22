//
//  HomeView.swift
//  CFH-TechTask-AmrMagdy
//
//  Created by Amr Magdy on 22/03/2024.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView {
            VenuesView(viewModel: VenuesViewModel())
                .tabItem {
                    Label("Venues", systemImage: "list.dash")
                }

            ProfileView(viewModel: ProfileViewModel())
                .tabItem {
                    Label("My Profile", systemImage: "person.crop.circle")
                }
            
            SettingsView(viewModel: SettingsViewModel())
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
        .navigationBarBackButtonHidden(true)
    }
}
