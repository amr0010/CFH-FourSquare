//
//  NetworkProvider.swift
//  CFH-TechTask-AmrMagdy
//
//  Created by Amr Magdy on 19/03/2024.
//


import Foundation

import Combine

protocol NetworkProvider {
    func request(_ info: RequestInfoConvertible) -> AnyPublisher<Data, Error>
}

struct RequestInfo {
    var urlString: String
    var method: String
    var parameters: [String: Any]?
    var headers: [String: String]?

    init(urlString: String, method: String = "GET", parameters: [String: Any]? = nil, headers: [String: String]? = nil) {
        self.urlString = urlString
        self.method = method
        self.parameters = parameters
        self.headers = headers
    }
}

protocol RequestInfoConvertible {
    func asRequestInfo() -> RequestInfo
} 
