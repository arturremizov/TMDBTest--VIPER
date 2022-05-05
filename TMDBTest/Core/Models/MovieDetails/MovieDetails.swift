//
//  MovieDetails.swift
//  TMDBTest
//
//  Created by Artur Remizov on 29.03.22.
//

import Foundation

struct Genres: Decodable {
    let id: UInt
    let name: String
}

struct MovieDetails: Decodable {
    let id: UInt
    let title: String
    let budget: UInt
    let overview: String
    let posterPath: String
    let releaseDate: String
    let runtime: UInt
    let voteAverage: Float
    let voteCount: UInt
    let genres: [Genres]
    let homepage: String
}
