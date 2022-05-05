//
//  MovieListViewOutput.swift
//  TMDBTest
//
//  Created by Artur Remizov on 29.03.22.
//

import Foundation

protocol MovieListViewOutput: AnyObject {
    var cellsCount: Int { get }
    
    func viewDidLoad()
    func movieCellModel(at indexPath: IndexPath) -> MovieCellModelData?
    func showMovieDetails(at indexPath: IndexPath)
    func shouldPresentLoadCell(at indexPath: IndexPath) -> Bool
    func loadMoreMovies()
}
