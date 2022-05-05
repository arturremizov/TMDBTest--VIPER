//
//  MovieList.swift
//  TMDBTest
//
//  Created by Artur Remizov on 28.03.22.
//

import Foundation

struct MovieList: Decodable {
    let page: UInt
    let results: [Movie]
    let totalPages: UInt
    let totalResults: UInt
}
