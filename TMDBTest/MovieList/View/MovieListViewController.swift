//
//  MovieListViewController.swift
//  TMDBTest
//
//  Created by Artur Remizov on 28.03.22.
//

import UIKit
import Kingfisher
 
class MovieListViewController: UICollectionViewController, StoryboardInstantiable {
    
    // MARK: - Properties
    var presenter: MovieListViewOutput!
    private let configurator: MovieListConfiguratorProtocol = MovieListConfigurator()
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configurator.configure(with: self)
        presenter.viewDidLoad()
        setupNavigationBar()
    }
    
    // MARK: - Setup
    private func setupNavigationBar() {
        navigationController?.navigationBar.tintColor = .white
    }
}

// MARK: - UICollectionViewDataSource
extension MovieListViewController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter.cellsCount
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if !presenter.shouldPresentLoadCell(at: indexPath) {
            return configureMovieCell(with: collectionView, at: indexPath)
        } else {
            return configureIndicatorCell(with: collectionView, at: indexPath)
        }
    }
    
    // MARK: - Configure Cells
    private func configureMovieCell(with collectionView: UICollectionView, at indexPath: IndexPath) -> MovieCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: MovieCell.self),
                                                            for: indexPath) as!  MovieCell
        guard let movieCellModel = presenter.movieCellModel(at: indexPath) else { return cell }
        cell.posterImageView.kf.setImage(with: movieCellModel.posterUrl)
        cell.titleLabel.text = movieCellModel.title
        cell.releaseDateLabel.text = movieCellModel.date
        return cell
    }
    
    private func configureIndicatorCell(with collectionView: UICollectionView, at indexPath: IndexPath) -> IndicatorCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: IndicatorCell.self),
                                                      for: indexPath) as! IndicatorCell
        cell.activityIndicatorView.startAnimating()
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension MovieListViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        if !presenter.shouldPresentLoadCell(at: indexPath) {
            let width = (collectionView.bounds.width / 2) - (flowLayout.minimumLineSpacing / 2) - flowLayout.sectionInset.left
            return CGSize(width: width, height: width * 1.84)
        } else {
            let width = collectionView.bounds.width - flowLayout.sectionInset.left - flowLayout.sectionInset.right
            let height = presenter.cellsCount == 1 ? view.safeAreaLayoutGuide.layoutFrame.height : 160
            return CGSize(width: width, height: height)
        }
    }
}

// MARK: - UICollectionViewDelegate
extension MovieListViewController {
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.showMovieDetails(at: indexPath)
    }
    
    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if cell is IndicatorCell {
            presenter.loadMoreMovies()
        }
    }
}

// MARK: - MovieListViewInput
extension MovieListViewController: MovieListViewInput {
    
    func reloadData() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}
