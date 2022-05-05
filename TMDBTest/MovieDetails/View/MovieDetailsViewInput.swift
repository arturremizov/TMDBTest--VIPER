//
//  MovieDetailsViewInput.swift
//  TMDBTest
//
//  Created by Artur Remizov on 29.03.22.
//

import Foundation

protocol MovieDetailsViewInput: AnyObject {
    func startLoadingMovieDetails()
    func didRecieveMovieDetails()
    func setMovieDetails(with movieDetailsData: MovieDetailsData)
}
