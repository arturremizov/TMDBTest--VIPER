//
//  RequestProtocol.swift
//  TMDBTest
//
//  Created by Artur Remizov on 28.03.22.
//

import Foundation

protocol RequestProtocol {
    var path: String { get }
    var urlParams: [String: String?] { get }
}

extension RequestProtocol {
    
    var host: String {
        APIConstants.host
    }
    
    var urlParams: [String: String?] {
        [:]
    }

    func createURLRequest() throws -> URLRequest {
     
        var components = URLComponents()
        components.scheme = "https"
        components.host = host
        components.path = path

        if !urlParams.isEmpty {
            components.queryItems = urlParams.map { URLQueryItem(name: $0, value: $1) }
        }
        guard let url = components.url else { throw NetworkError.invalidURL }
        let urlRequest = URLRequest(url: url)
        return urlRequest
    }
}
