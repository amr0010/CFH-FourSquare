//
//  GithubRouter.swift
//  CFH-TechTask-AmrMagdy
//
//  Created by Amr Magdy on 19/03/2024.
//


import Foundation

enum FoursquareRouter: RequestInfoConvertible {
    case searchVenues(latitude: Double, longitude: Double)

    var endpoint: String {
        "https://api.foursquare.com/v2"
    }

    var urlString: String {
        "\(endpoint)/\(path)"
    }

    var path: String {
        switch self {
        case .searchVenues(let latitude, let longitude):
            return "venues/search?ll=\(latitude),\(longitude)&client_id=\(FoursquareCredentials.clientId)&client_secret=\(FoursquareCredentials.secretKey)&v=20180910"
        }
    }

    func asRequestInfo() -> RequestInfo {
        let requestInfo: RequestInfo = RequestInfo(urlString: urlString)
        // Set other properties like headers, parameters for requestInfo here
        return requestInfo
    }
}
