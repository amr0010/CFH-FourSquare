//
//  NetworkClient.swift
//  CFH-TechTask-AmrMagdy
//
//  Created by Amr Magdy on 19/03/2024.
//


import Foundation
import Combine

class NetworkClient: NetworkProvider {
    static let instance = NetworkClient()
    
    private init() {}

    func request(_ info: RequestInfoConvertible) -> AnyPublisher<Data, Error> {
        let requestInfo = info.asRequestInfo()
        
        guard let url = URL(string: requestInfo.urlString) else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = requestInfo.method

        requestInfo.headers?.forEach { urlRequest.addValue($1, forHTTPHeaderField: $0) }

        if let parameters = requestInfo.parameters {
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters)
            } catch {
                return Fail(error: error).eraseToAnyPublisher()
            }
        }
        
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .mapError { $0 as Error }
            .map(\.data)
            .eraseToAnyPublisher()
    }
}
