//
//  MovieDetailsViewController.swift
//  TMDBTest
//
//  Created by Artur Remizov on 28.03.22.
//

import UIKit
import Kingfisher

class MovieDetailsViewController: UIViewController, StoryboardInstantiable {

    // MARK: - Outlets
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailsLabel: UILabel!
    @IBOutlet weak var voteLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    // MARK: - Instance Properties
    var presenter: MovieDetailsViewOutput!

    // MARK: - Object Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.showMovieDetails()
    }
}

// MARK: - MovieDetailsViewInput
extension MovieDetailsViewController: MovieDetailsViewInput {
    
    func startLoadingMovieDetails() {
        activityIndicatorView.startAnimating()
        scrollView.isHidden = true
    }
    
    func didRecieveMovieDetails() {
        activityIndicatorView.stopAnimating()
        scrollView.isHidden = false
    }
    
    func setMovieDetails(with movieDetailsData: MovieDetailsData) {
        posterImageView.kf.setImage(with: movieDetailsData.posterUrl)
        titleLabel.text = movieDetailsData.title
        detailsLabel.text = movieDetailsData.detailsString
        voteLabel.attributedText = movieDetailsData.voteAttrString
        descriptionLabel.text = movieDetailsData.overview
    }
}
