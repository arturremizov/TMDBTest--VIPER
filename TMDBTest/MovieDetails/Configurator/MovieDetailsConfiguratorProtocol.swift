//
//  MovieDetailsConfiguratorProtocol.swift
//  TMDBTest
//
//  Created by Artur Remizov on 29.03.22.
//

import Foundation

protocol MovieDetailsConfiguratorProtocol: AnyObject {
    func configure(with movieDetailsViewController: MovieDetailsViewController, and movie: Movie)
}
