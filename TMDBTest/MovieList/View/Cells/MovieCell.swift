//
//  MovieCell.swift
//  TMDBTest
//
//  Created by Artur Remizov on 28.03.22.
//

import UIKit

class MovieCell: UICollectionViewCell {
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        posterImageView.layer.cornerRadius = 16
    }
}
