//
//  MovieListRouter.swift
//  TMDBTest
//
//  Created by Artur Remizov on 28.03.22.
//

import Foundation
import UIKit

class MovieListRouter {
    // MARK: - Instance Properties
    weak var viewController: MovieListViewController!
    
    // MARK: - Object Lifecycle
    required init(viewController: MovieListViewController) {
        self.viewController = viewController
    }
}

// MARK: - MovieListRouterInput
extension MovieListRouter: MovieListRouterInput {
    
    func openMovieDetailsViewController(with movie: Movie) {
        let vc = MovieDetailsViewController.instanceFromStoryboard()
        let configurator: MovieDetailsConfiguratorProtocol = MovieDetailsConfigurator()
        configurator.configure(with: vc, and: movie)
        
        viewController.navigationController?.pushViewController(vc, animated: true)
    }
    
    func presentErrorAlert(with message: String) {
        let ac = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .cancel))
        viewController.present(ac, animated: true)
    }
}
