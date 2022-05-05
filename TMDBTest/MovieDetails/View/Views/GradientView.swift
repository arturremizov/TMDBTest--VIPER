//
//  GradientView.swift
//  TMDBTest
//
//  Created by Artur Remizov on 29.03.22.
//

import UIKit

class GradientView: UIView {
    
    // MARK: - Instance Properties
    var firstColor: UIColor = .clear
    var secondColor: UIColor = UIColor(named: "AppBackgroundColor") ?? .black

    lazy var gradientLayer: CAGradientLayer = {
        let layer = CAGradientLayer()
        layer.colors = [firstColor.cgColor, secondColor.cgColor]
        //layer.locations = [0.5]
        return layer
    }()
    
    // MARK: - Object Lifecycle
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        applyGradient()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }

    func applyGradient() {
        layer.sublayers = [gradientLayer]
    }
}
