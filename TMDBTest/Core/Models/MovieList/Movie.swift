//
//  Movie.swift
//  TMDBTest
//
//  Created by Artur Remizov on 28.03.22.
//

import Foundation

struct Movie: Decodable {
    let id: UInt
    let title: String
    let overview: String
    let posterPath: String
    let releaseDate: String
    let genreIds: [Int]
    let voteAverage: Float
    let voteCount: UInt
}
