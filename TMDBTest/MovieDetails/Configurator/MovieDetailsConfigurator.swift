//
//  MovieDetailsConfigurator.swift
//  TMDBTest
//
//  Created by Artur Remizov on 29.03.22.
//

import Foundation

class MovieDetailsConfigurator: MovieDetailsConfiguratorProtocol {
    
    func configure(with view: MovieDetailsViewController, and movie: Movie) {
        let presenter = MovieDetailsPresenter(view: view)
        let interactor = MovieDetailsInteractor(presenter: presenter, movie: movie)
        view.presenter = presenter
        presenter.interactor = interactor
    }
}
