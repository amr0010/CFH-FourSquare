//
//  ProfileView.swift
//  CFH-TechTask-AmrMagdy
//
//  Created by Amr Magdy on 22/03/2024.
//
import SwiftUI

struct ProfileView: View {
    @ObservedObject var viewModel: ProfileViewModel
    
    var body: some View {
        VStack {
            if let user = viewModel.user {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .padding(.top, 20)
                
                Text("\(user.firstName) \(user.lastName)")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.bottom, 5)
                
                Text(user.email)
                    .font(.headline)
                    .foregroundColor(.gray)
                    .padding(.bottom, 10)
                
                Divider()
                    .padding(.vertical, 10)
                
                Text("Age: \(user.age)")
                    .font(.body)
                    .padding(.bottom, 5)
                
                Spacer()
            } else {
                ProgressView("Loading...")
            }
        }
        .padding()
        .navigationBarTitle("My Profile", displayMode: .inline)
        .onAppear {
            viewModel.fetchCurrentUser()
        }
    }
}
