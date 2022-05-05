//
//  MovieListInteractorInput.swift
//  TMDBTest
//
//  Created by Artur Remizov on 29.03.22.
//

import Foundation

protocol MovieListInteractorInput: AnyObject {
    func fetchMovies(withPage page: UInt)
}
