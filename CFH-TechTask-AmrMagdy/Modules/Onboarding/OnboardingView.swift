//
//  ContentView.swift
//  CFH-TechTask-AmrMagdy
//
//  Created by Amr Magdy on 19/03/2024.
//

import SwiftUI

struct OnboardingView: View {
    @State private var currentPage = 0
    private let totalPages = 3

    var body: some View {
        VStack {
            TabView(selection: $currentPage) {
                OnboardingStepView(title: "Welcome to the App", content: "Start exploring places around you quickly and easily.", imageName: "star", currentPage: 0)
                    .tag(0)
                OnboardingStepView(title: "Easy Registration", content: "Sign up in a few easy steps and start your journey.", imageName: "house", currentPage: 1)
                    .tag(1)
                OnboardingStepView(title: "Find Places Near You", content: "Locate the best venues around with real-time data.", imageName: "location.fill.viewfinder", currentPage: 2)
                    .tag(2)
            }
            .tabViewStyle(PageTabViewStyle())

            HStack(spacing: 10) {
                ForEach(0..<totalPages, id: \.self) { index in
                    Circle()
                        .fill(currentPage == index ? Color.blue : Color.gray)
                        .frame(width: 10, height: 10)
                }
            }
            .padding()
        }
    }
}

struct OnboardingStepView: View {
    var title: String
    var content: String
    var imageName: String
    var currentPage: Int
    @State private var navigatingToNext = false
    @State private var navigatingToAccessDeniedView = false
    @EnvironmentObject var locationManager: LocationManager

    var body: some View {
        VStack {
            Image(systemName: imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text(title)
                .font(.title)
                .fontWeight(.bold)
            Text(content)
                .font(.body)
                .multilineTextAlignment(.center)
                .padding()
            if currentPage == 2 {
                Button("Get Started") {
                    if locationManager.authorizationStatus == .notDetermined {
                        locationManager.requestLocationAccess()
                    } else if locationManager.authorizationStatus == .authorizedAlways || locationManager.authorizationStatus == .authorizedWhenInUse {
                        navigatingToNext = true
                    } else {
                        navigatingToAccessDeniedView = true
                    }
                }
                .onChange(of: locationManager.authorizationStatus) { newStatus in
                    switch newStatus {
                    case .authorizedAlways, .authorizedWhenInUse:
                        navigatingToNext = true
                    case .denied, .restricted:
                        navigatingToAccessDeniedView = true
                    default:
                        break
                    }
                }
                .background(
                    NavigationLink(destination: LoginView(), isActive: $navigatingToNext) {
                        EmptyView()
                    }
                )
                .background(
                    NavigationLink(destination: LocationAccessDeniedView(), isActive: $navigatingToAccessDeniedView) {
                        EmptyView()
                    }
                )
                .padding()
            }
        }
        .padding()
    }
}


#Preview {
    OnboardingView()
}
