//
//  GithubNetworkProvider.swift
//  CFH-TechTask-AmrMagdy
//
//  Created by Amr Magdy on 19/03/2024.
//


import Foundation
import Combine

protocol FoursquareNetworkProvider {
    func searchVenues(latitude: Double, longitude: Double) -> AnyPublisher<VenuesResponse, Error>
}

class FoursquareNetworkClient: FoursquareNetworkProvider {
    var networkClient: NetworkProvider = NetworkClient.instance

    func searchVenues(latitude: Double, longitude: Double) -> AnyPublisher<VenuesResponse, Error> {
        networkClient.request(FoursquareRouter.searchVenues(latitude: latitude, longitude: longitude)).decode()
    }
}
