//
//  MovieListConfigurator.swift
//  TMDBTest
//
//  Created by Artur Remizov on 28.03.22.
//

import Foundation

class MovieListConfigurator: MovieListConfiguratorProtocol {
    
    func configure(with viewController: MovieListViewController) {
        
        let presenter = MovieListPresenter(view: viewController)
        let interactor = MovieListInteractor(presenter: presenter)
        let router = MovieListRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}
