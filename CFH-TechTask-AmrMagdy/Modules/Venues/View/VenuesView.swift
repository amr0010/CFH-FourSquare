//
//  VenuesView.swift
//  CFH-TechTask-AmrMagdy
//
//  Created by Amr Magdy on 22/03/2024.
//

import SwiftUI

struct VenuesView: View {
    @StateObject var viewModel = VenuesViewModel()
    @EnvironmentObject var locationManager: LocationManager

    var body: some View {
        VStack {
            Picker("View Mode", selection: $viewModel.selectedSegment) {
                Text("List").tag(0)
                Text("Map").tag(1)
            }
            .pickerStyle(.segmented)
            .padding()
            
            if viewModel.selectedSegment == 0 {
                ListView(venues: viewModel.venues)
            } else {
                MapView(venues: viewModel.venues)
            }
        }
        .onAppear {
            if let currentLocation = locationManager.currentLocation {
                viewModel.fetchVenues(latitude: currentLocation.latitude, longitude: currentLocation.longitude)
            } else {
                print("Current location is not available.")
            }
        }
    }
}

struct VenuesView_Previews: PreviewProvider {
    static var previews: some View {
        VenuesView()
    }
}
