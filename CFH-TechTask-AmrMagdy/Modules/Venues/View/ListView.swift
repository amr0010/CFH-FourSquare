//
//  ListView.swift
//  CFH-TechTask-AmrMagdy
//
//  Created by Amr Magdy on 22/03/2024.
//

import SwiftUI

struct ListView: View {
    let venues: [Venue]
    
    var body: some View {
        List(venues) { venue in
            VStack(alignment: .leading) {
                Text(venue.name)
                    .font(.headline)

                if let address = venue.location.address {
                    Text("Address: \(address)")
                        .font(.subheadline)
                }

                if let firstCategory = venue.categories.first {
                    HStack {
                        AsyncImage(url: URL(string: firstCategory.icon.iconUrl))
                            .frame(width: 30, height: 30)
                            .clipShape(Circle())

                        Text(firstCategory.name)
                            .font(.subheadline)
                    }
                }
            }
            .padding(.vertical)
        }
    }
}
