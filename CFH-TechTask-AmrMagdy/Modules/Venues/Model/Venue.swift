//
//  Venue.swift
//  CFH-TechTask-AmrMagdy
//
//  Created by Amr Magdy on 22/03/2024.
//

import Foundation

struct VenuesResponse: Codable {
    let response: VenuesList
}

struct VenuesList: Codable {
    let venues: [Venue]
}

struct Venue: Codable, Identifiable {
    let id: String
    let name: String
    let location: VenueLocation
    let categories: [VenueCategory]
    
    struct VenueLocation: Codable {
        let address: String?
        let lat: Double
        let lng: Double
    }

    struct VenueCategory: Codable {
        let name: String
        let icon: VenueIcon
    }

    struct VenueIcon: Codable {
        let prefix: String
        let suffix: String

        var iconUrl: String {
            "\(prefix)bg_64\(suffix)"
        }
    }
}
