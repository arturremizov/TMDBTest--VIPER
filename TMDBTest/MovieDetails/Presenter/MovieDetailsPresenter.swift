//
//  MovieDetailsPresenter.swift
//  TMDBTest
//
//  Created by Artur Remizov on 29.03.22.
//

import Foundation
import UIKit

class MovieDetailsPresenter {
    
    // MARK: - Instance Properties
    weak var view: MovieDetailsViewInput!
    var interactor: MovieDetailsInteractorInput!
    
    // MARK: - Object Lifecycle
    required init(view: MovieDetailsViewInput) {
        self.view = view
    }
}

// MARK: - MovieDetailsViewOutput
extension MovieDetailsPresenter: MovieDetailsViewOutput {
    func showMovieDetails() {
        view.startLoadingMovieDetails()
        interactor.fetchMovieDetails()
    }
}

// MARK: - MovieDetailsInteractorOutput
extension MovieDetailsPresenter: MovieDetailsInteractorOutput {
    
    func recieveMovieDetails(_ movieDetails: MovieDetails) {
        
        let posterUrl = MoviePosterManager.shared.getMoviePosterUrl(with: movieDetails.posterPath,
                                                                    posterSize: .medium)
        let detailsString = setupMovieDetailsString(with: movieDetails)
        let voteString = setupVoteString(with: movieDetails.voteAverage)
        
        let movieDetailsData = MovieDetailsData(posterUrl: posterUrl,
                                                title: movieDetails.title,
                                                detailsString: detailsString,
                                                voteAttrString: voteString,
                                                overview: movieDetails.overview)
        
        DispatchQueue.main.async { [weak self] in
            self?.view.didRecieveMovieDetails()
            self?.view.setMovieDetails(with: movieDetailsData)
        }
    }
    
    private func setupMovieDetailsString(with movieDetails: MovieDetails) -> String {
        
        var details: [String] = []
        if let releaseYear = movieDetails.releaseDate.yearFromMovieStringDate() {
            details.append(releaseYear)
        }
        if !movieDetails.genres.isEmpty {
            let genres = movieDetails.genres.map { $0.name }
            details.append(genres.joined(separator: ", "))
        }
        
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute]
        formatter.unitsStyle = .abbreviated
        if let duration = formatter.string(from: TimeInterval(movieDetails.runtime * 60)) {
            details.append(duration)
        }
        let detailsString = details.joined(separator: " • ")
        return detailsString
    }
    
    private func setupVoteString(with voteValue: Float) -> NSAttributedString {
        
        let totalStarsCount = 5
        let votedStarsCount = Int(round(voteValue / 2))
        
        let attributes: [NSAttributedString.Key: AnyObject] = [ .foregroundColor: UIColor.systemYellow ]
        let votedAttrString = NSMutableAttributedString(string: "\(voteValue) ", attributes: attributes)
        
        for i in 1...totalStarsCount {
            let tintColor: UIColor = i <= votedStarsCount ? .systemYellow : .lightGray
            let imageAttachment = NSTextAttachment()
            imageAttachment.image = UIImage(systemName: "star.fill")?.withTintColor(tintColor)
            
            let starAttrString = NSMutableAttributedString(attachment: imageAttachment)
            votedAttrString.append(starAttrString)
        }
        return votedAttrString
    }
}
