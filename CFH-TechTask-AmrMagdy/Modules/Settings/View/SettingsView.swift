//
//  SettingsView.swift
//  CFH-TechTask-AmrMagdy
//
//  Created by Amr Magdy on 22/03/2024.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel: SettingsViewModel
    @State private var navigatingToLogin = false

    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: TermsAndConditionsView()) {
                    Text("Terms and Conditions")
                }
                Button("Logout") {
                    viewModel.logoutUser()
                    presentationMode.wrappedValue.dismiss()
                }
                .foregroundColor(.red)
            }
            .navigationBarTitle("Settings")
            .navigationBarItems(trailing: Button("Close") {
                presentationMode.wrappedValue.dismiss()
            })
        } .background(NavigationLink("", destination: LoginView(), isActive: $navigatingToLogin))
        .onAppear {
            viewModel.onLogoutSuccess = {
                navigatingToLogin = true
            }
        }
    }
}
