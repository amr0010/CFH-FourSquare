//
//  VenueDetailView.swift
//  CFH-TechTask-AmrMagdy
//
//  Created by Amr Magdy on 22/03/2024.
//

import SwiftUI

struct VenueDetailView: View {
    let venue: Venue

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(venue.name)
                .font(.headline)

            if let address = venue.location.address {
                Text("Address: \(address)")
            }

            if let firstCategory = venue.categories.first {
                HStack {
                    AsyncImage(url: URL(string: firstCategory.icon.iconUrl))
                        .frame(width: 30, height: 30)
                        .clipShape(Circle())

                    Text(firstCategory.name)
                }
            }
        }
        .padding()
    }
}
