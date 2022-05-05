//
//  NetworkManager.swift
//  TMDBTest
//
//  Created by Artur Remizov on 28.03.22.
//

import Foundation

protocol NetworkManagerProtocol {
    func perform(_ request: RequestProtocol,
                 success: @escaping ((Data) -> Void),
                 failure: @escaping ((Error?) -> Void))
}

class NetworkManager: NetworkManagerProtocol {
    
    private let urlSession: URLSession
    
    init(urlSession: URLSession = URLSession.shared) {
        self.urlSession = urlSession
    }
    
    func perform(_ request: RequestProtocol,
                 success: @escaping ((Data) -> Void),
                 failure: @escaping ((Error?) -> Void)) {
        
        do {
            let request = try request.createURLRequest()
            urlSession.dataTask(with: request) { data, _, error in
                guard error == nil, let data = data else {
                    failure(error)
                    return
                }
                success(data)
            }.resume()
        } catch {
            failure(error)
        }
    }
}
