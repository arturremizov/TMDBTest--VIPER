//
//  MovieListInteractor.swift
//  TMDBTest
//
//  Created by Artur Remizov on 28.03.22.
//

import Foundation

class MovieListInteractor {
    
    // MARK: - Instance Properties
    weak var presenter: MovieListInteractorOutput!
    private var requestManager: RequestManagerProtocol
    
    // MARK: - Object Lifecycle
    required init(presenter: MovieListInteractorOutput,
                  requestManager: RequestManagerProtocol = RequestManager()) {
        self.presenter = presenter
        self.requestManager = requestManager
    }
}

// MARK: - MovieListInteractorInput
extension MovieListInteractor: MovieListInteractorInput {
    
    func fetchMovies(withPage page: UInt) {
        
        let successHandler: ((MovieList) -> Void) = { [weak self] movieList in
            self?.presenter.moviesDidRecieve(movieList.results,
                                             page: movieList.page,
                                             totalPages: movieList.totalPages)
        }
        requestManager.perform(MovieRequest.getPopularMoviesWith(page: page),
                               success: successHandler,
                               failure: { [weak self] error in
            if let error = error {
                self?.presenter.errorDidRecieve(error)
            }
        })
    }
}
