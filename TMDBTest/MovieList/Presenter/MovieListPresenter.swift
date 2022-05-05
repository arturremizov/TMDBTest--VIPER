//
//  MovieListPresenter.swift
//  TMDBTest
//
//  Created by Artur Remizov on 28.03.22.
//

import Foundation

class MovieListPresenter {
    
    // MARK: - Instance Properties
    weak var view: MovieListViewInput!
    var interactor: MovieListInteractorInput!
    var router: MovieListRouterInput!
    
    private var currentMovieListPage: UInt = 0
    private var totalPages: UInt = 0
    private var movies: [Movie] = []
    private var movieCellModels: [MovieCellModelData] = []
    
    // MARK: - Object Lifecycle
    required init(view: MovieListViewInput) {
        self.view = view
    }
}

// MARK: - MovieListViewOutput
extension MovieListPresenter: MovieListViewOutput {
    
    func viewDidLoad() {
        interactor.fetchMovies(withPage: currentMovieListPage + 1)
    }
    
    var cellsCount: Int {
        if totalPages == 0 {
            return 1
        }
        if currentMovieListPage < totalPages {
            return movieCellModels.count + 1
        }
        return movieCellModels.count
    }
    
    func movieCellModel(at indexPath: IndexPath) -> MovieCellModelData? {
        if movieCellModels.indices.contains(indexPath.row) {
            return movieCellModels[indexPath.row]
        }
        return nil
    }
    
    func shouldPresentLoadCell(at indexPath: IndexPath) -> Bool {
        movies.count == indexPath.row
    }
    
    func loadMoreMovies() {
        interactor.fetchMovies(withPage: currentMovieListPage + 1)
    }
    
    func showMovieDetails(at indexPath: IndexPath) {
        if movies.indices.contains(indexPath.row) {
            let movie = movies[indexPath.row]
            router.openMovieDetailsViewController(with: movie)
        }
    }
}

// MARK: - MovieListInteractorOutput
extension MovieListPresenter: MovieListInteractorOutput {
    
    func moviesDidRecieve(_ movies: [Movie], page: UInt, totalPages: UInt) {
        self.currentMovieListPage = page
        self.totalPages = totalPages
        self.movies += movies
        self.movieCellModels += movies.map { movie in
            let posterUrl = MoviePosterManager.shared.getMoviePosterUrl(with: movie.posterPath, posterSize: .small)
            let movieCellModel = MovieCellModelData(title: movie.title,
                                                posterUrl: posterUrl,
                                                date: movie.releaseDate.formatMovieStringDate())
            return movieCellModel
        }
        view.reloadData()
    }
    
    func errorDidRecieve(_ error: Error) {
        DispatchQueue.main.async {
            self.router.presentErrorAlert(with: error.localizedDescription)
        }
    }
}
