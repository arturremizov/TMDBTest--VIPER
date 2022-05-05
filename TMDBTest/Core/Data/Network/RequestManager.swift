//
//  RequestManager.swift
//  TMDBTest
//
//  Created by Artur Remizov on 28.03.22.
//

import Foundation

protocol RequestManagerProtocol {
    func perform<T>(_ request: RequestProtocol,
                    success: @escaping ((T) -> Void),
                    failure: @escaping ((Error?) -> Void)) where T: Decodable
}

class RequestManager: RequestManagerProtocol {
    
    let networkManager: NetworkManagerProtocol
    let dataParser: DataParserProtocol
    
    init(networkManager: NetworkManagerProtocol = NetworkManager(),
         dataParser: DataParserProtocol = DataParser()) {
        self.networkManager = networkManager
        self.dataParser = dataParser
    }
    
    func perform<T>(_ request: RequestProtocol,
                    success: @escaping ((T) -> Void),
                    failure: @escaping ((Error?) -> Void)) where T: Decodable {
        
        networkManager.perform(request) { [weak self] data in
            guard let self = self else { return }
            do {
                let decodedData: T = try self.dataParser.parseJSONData(data)
                success(decodedData)
            } catch {
                failure(error)
            }
        } failure: { error in
            failure(error)
        }
    }
}
