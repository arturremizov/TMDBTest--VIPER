//
//  String+DateFormatter.swift
//  TMDBTest
//
//  Created by Artur Remizov on 28.03.22.
//

import Foundation

extension String {
    
    private enum DateStyle {
        case medium
        case year
    }
    
    private func formatMovieStringDate(withDateStyle dateStyle: DateStyle) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        guard let releaseDate = dateFormatter.date(from: self) else { return nil }
        switch dateStyle {
        case .medium:
            dateFormatter.dateStyle = .medium
        case .year:
            dateFormatter.dateFormat = "yyyy"
        }
        return dateFormatter.string(from: releaseDate)
    }
    
    public func formatMovieStringDate() -> String? {
        formatMovieStringDate(withDateStyle: .medium)
    }
    
    public func yearFromMovieStringDate() -> String? {
        formatMovieStringDate(withDateStyle: .year)
    }
}
