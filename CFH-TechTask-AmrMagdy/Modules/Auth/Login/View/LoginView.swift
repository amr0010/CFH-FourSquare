//
//  LoginView.swift
//  CFH-TechTask-AmrMagdy
//
//  Created by Amr Magdy on 19/03/2024.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject var locationManager: LocationManager
    @StateObject private var viewModel = LoginViewModel()
    @State private var showingAlert = false
    @State private var alertMessage = ""
    @State private var navigatingToRegistration = false
    @State private var navigatingToHome = false
    
    var body: some View {
            Form {
                Section(header: Text("Account Information")) {
                    TextField("Email", text: $viewModel.email)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                    SecureField("Password", text: $viewModel.password)
                }

                Button("Login") {
                        viewModel.login()
                }

                Button("Don't have an account? Sign Up") {
                    navigatingToRegistration = true
                }
                .foregroundColor(.blue)
            }
            .navigationBarTitle("Login")
           
            .alert(isPresented: $viewModel.showLoginError) {
                           Alert(title: Text("Error"), message: Text(viewModel.loginErrorMessage), dismissButton: .default(Text("OK")))
                       }
            .background(NavigationLink("", destination: RegistrationView(), isActive: $navigatingToRegistration))
            .background(NavigationLink("", destination: HomeView(), isActive: $navigatingToHome))
            .onAppear {
                viewModel.onLoginSuccess = {
                    navigatingToHome = true
                }
            }
            .navigationBarBackButtonHidden(true)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
