//
//  MovieListInteractorOutput.swift
//  TMDBTest
//
//  Created by Artur Remizov on 29.03.22.
//

import Foundation

protocol MovieListInteractorOutput: AnyObject {
    func moviesDidRecieve(_ movies: [Movie], page: UInt, totalPages: UInt)
    func errorDidRecieve(_ error: Error)
}
