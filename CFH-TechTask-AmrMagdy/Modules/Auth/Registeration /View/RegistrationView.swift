//
//  RegistrationView.swift
//  CFH-TechTask-AmrMagdy
//
//  Created by Amr Magdy on 19/03/2024.
//

import SwiftUI

struct RegistrationView: View {
    @StateObject private var viewModel = RegistrationViewModel()
    @State private var showingAlert = false
    @State private var alertMessage = ""
    @State private var navigatingToLogin = false

    var body: some View {
            Form {
                Section(header: Text("Personal Information")) {
                    TextField("First Name", text: $viewModel.firstName)
                    TextField("Last Name", text: $viewModel.lastName)
                    TextField("Age", text: $viewModel.age)
                        .keyboardType(.numberPad)
                }

                Section(header: Text("Account Information")) {
                    TextField("Email", text: $viewModel.email)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                    SecureField("Password", text: $viewModel.password)
                    SecureField("Confirm Password", text: $viewModel.confirmPassword)
                }

                Button("Register") {
                    if viewModel.isInputValid() {
                        viewModel.register()
                    } else {
                        alertMessage = "Please check your inputs and try again."
                        showingAlert = true
                    }
                }
            }
            .navigationBarTitle("Register")
            .alert(isPresented: $showingAlert) {
                Alert(title: Text("Error"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            } 
            .onAppear {
                viewModel.onSignUpSuccess = {
                    navigatingToLogin = true
                }
            }
            .background(
                NavigationLink("", destination: LoginView(), isActive: $navigatingToLogin)
            )
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
