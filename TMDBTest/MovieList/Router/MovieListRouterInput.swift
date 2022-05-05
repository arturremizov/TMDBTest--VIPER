//
//  MovieListRouterInput.swift
//  TMDBTest
//
//  Created by Artur Remizov on 29.03.22.
//

import Foundation

protocol MovieListRouterInput: AnyObject {
    func openMovieDetailsViewController(with movie: Movie)
    func presentErrorAlert(with message: String)
}
