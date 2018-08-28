//
//  BottomGradientView.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-12-19.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import UIKit

class BottomGradientView: UIView {
    
    
    // MARK: - Properties
    
    var initialBackgroundColor: UIColor?
    
    
    // MARK: - Public Functions
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupGradientLayer()
    }
}


// MARK: - Private Properties

private extension BottomGradientView {
    
    var shouldSetupGradientLayer: Bool {
        return (layer.sublayers?.count ?? 0) == 0
    }
}


// MARK: - Private Functions

private extension BottomGradientView {
    
    func createGradientLayer(for superview: UIView) -> CAGradientLayer {
        let fromColor = superview.backgroundColor?.withAlphaComponent(0) ?? UIColor.clear
        let toColor = superview.backgroundColor ?? UIColor.clear
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.frame.size.width = 5000   // TODO: Should use constraints instead
        gradientLayer.colors = [fromColor.cgColor, toColor.cgColor]
        return gradientLayer
    }
    
    func setupGradientLayer() {
        backgroundColor = UIColor.clear
        guard shouldSetupGradientLayer else { return }
        guard let superview = superview else { return }
        layer.addSublayer(createGradientLayer(for: superview))
    }
}
