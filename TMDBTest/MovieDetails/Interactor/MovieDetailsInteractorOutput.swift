//
//  MovieDetailsInteractorOutput.swift
//  TMDBTest
//
//  Created by Artur Remizov on 29.03.22.
//

import Foundation

protocol MovieDetailsInteractorOutput: AnyObject {
    func recieveMovieDetails(_ movieDetails: MovieDetails)
}
