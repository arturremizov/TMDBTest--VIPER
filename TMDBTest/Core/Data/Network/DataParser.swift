//
//  DataFetcher.swift
//  TMDBTest
//
//  Created by Artur Remizov on 28.03.22.
//

import Foundation

protocol DataParserProtocol: AnyObject {
    func parseJSONData<T>(_ data: Data) throws -> T where T: Decodable
}

class DataParser: DataParserProtocol {
    
    func parseJSONData<T>(_ data: Data) throws -> T where T: Decodable {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        return try jsonDecoder.decode(T.self, from: data)
    }
}
