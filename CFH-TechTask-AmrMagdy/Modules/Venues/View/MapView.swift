//
//  MapView.swift
//  CFH-TechTask-AmrMagdy
//
//  Created by Amr Magdy on 22/03/2024.
//

import SwiftUI
import MapKit

struct MapView: View {
    @EnvironmentObject var locationManager: LocationManager
    let venues: [Venue]
    @State private var selectedVenue: Venue?
    @State private var showingDetail = false
    @State private var mapRegion: MKCoordinateRegion
    
    init(venues: [Venue]) {
        self.venues = venues
        _mapRegion = State(initialValue: MKCoordinateRegion())
    }
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $locationManager.region, showsUserLocation: true, annotationItems: venues) { venue in
                MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: venue.location.lat, longitude: venue.location.lng)) {
                    VStack {
                        if let imageUrl = venue.categories.first?.icon.iconUrl {
                            AsyncImage(url: URL(string: imageUrl))
                                .frame(width: 30, height: 30)
                                .clipShape(Circle())
                        }
                        Text(venue.name)
                            .font(.caption)
                    }
                    Button(action: {
                        self.selectedVenue = venue
                        self.showingDetail = true
                    }) {
                        Image(systemName: "info.circle")
                            .foregroundColor(.blue)
                    }
                    
                }
            }
            if showingDetail, let venue = selectedVenue {
                Color.black.opacity(0.5)
                    .edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        showingDetail = false
                    }
                VenueDetailView(venue: venue)
                    .frame(width: 300, height: 200)
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 10)
                    .padding()
            }
        }
        
        .onAppear {
            if let currentLocation = locationManager.currentLocation {
                mapRegion = MKCoordinateRegion(center: currentLocation, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
            }
        }
        
    }
}

