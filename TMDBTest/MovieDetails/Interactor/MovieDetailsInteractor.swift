//
//  MovieDetailsInteractor.swift
//  TMDBTest
//
//  Created by Artur Remizov on 29.03.22.
//

import Foundation

class MovieDetailsInteractor {
    
    // MARK: - Instance Properties
    weak var presenter: MovieDetailsInteractorOutput!
    private var requestManager: RequestManagerProtocol
    
    private var movie: Movie
    
    // MARK: - Object Lifecycle
    required init(presenter: MovieDetailsInteractorOutput,
                  movie: Movie,
                  requestManager: RequestManagerProtocol = RequestManager()) {
        self.presenter = presenter
        self.movie = movie
        self.requestManager = requestManager
    }
}

// MARK: - MovieDetailsInteractorInput
extension MovieDetailsInteractor: MovieDetailsInteractorInput {
    
    func fetchMovieDetails() {
        
        let request = MovieRequest.getMovieDetailsWith(movieId: String(movie.id))
        let successHandler: ((MovieDetails) -> Void) = { [weak self] movieDetails in
            self?.presenter.recieveMovieDetails(movieDetails)
        }
        requestManager.perform(request,
                               success: successHandler,
                               failure: { error in
        })
    }
}
