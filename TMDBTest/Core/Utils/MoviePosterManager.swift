//
//  MoviePosterManager.swift
//  TMDBTest
//
//  Created by Artur Remizov on 28.03.22.
//

import Foundation

class MoviePosterManager {
    
    enum MoviePosterSize: String {
        case small = "w300"
        case medium = "w500"
        case large = "w800"
    }
    
    // MARK: - Static Properties
    static let shared = MoviePosterManager()
    
    // MARK: - Instance Properties
    private let imageURL = "https://image.tmdb.org/t/p/"
    
    // MARK: - Object Lifecycle
    private init() { }
    
    // MARK: - Instance Methods
    func getMoviePosterUrl(with posterPath: String, posterSize: MoviePosterSize = .medium) -> URL {
        let url = URL(string: imageURL)!
        let posterUrl = url.appendingPathComponent(posterSize.rawValue).appendingPathComponent(posterPath)
        return posterUrl
    }
}
