//
//  VenuesViewModel.swift
//  CFH-TechTask-AmrMagdy
//
//  Created by Amr Magdy on 22/03/2024.
//

import Foundation
import Combine

class VenuesViewModel: ObservableObject {
    private var cancellables = Set<AnyCancellable>()
    @Published var venues: [Venue] = []
    @Published var selectedSegment: Int = 0
    private let networkClient = FoursquareNetworkClient()


    func fetchVenues(latitude: Double, longitude: Double) {
           networkClient.searchVenues(latitude: latitude, longitude: longitude)
               .sink(receiveCompletion: { completion in
                   
               }, receiveValue: { venuesResponse in
                   self.venues = venuesResponse.response.venues
               })
               .store(in: &cancellables)
       }
}
