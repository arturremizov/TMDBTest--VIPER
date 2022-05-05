//
//  MovieRequest.swift
//  TMDBTest
//
//  Created by Artur Remizov on 4.05.22.
//

import Foundation

enum MovieRequest: RequestProtocol {
    
    case getPopularMoviesWith(page: UInt)
    case getMovieDetailsWith(movieId: String)
    
    var path: String {
        switch self {
        case .getPopularMoviesWith:
            return "/3/discover/movie"
        case .getMovieDetailsWith(let movieId):
            return "/3/movie/" + movieId
        }
    }
    
    private var defaultUrlParams: [String : String] {
        [
            "api_key": APIConstants.apiKey,
            "language": "en-US"
        ]
    }
     
    var urlParams: [String : String?] {
        switch self {
        case .getPopularMoviesWith(let page):
            var parameters = [
                "sort_by": "popularity.desc",
                "include_adult": "false",
                "include_video": "false",
                "page": String(page),
                "with_watch_monetization_types": "flatrate"
            ]
            parameters = defaultUrlParams.merging(parameters) { (_, new) in new }
            return parameters
            
        case .getMovieDetailsWith:
            return defaultUrlParams
        }
    }
    
}
