//
//  BaseViewController.swift
//  iExtra
//
//  Created by Daniel Saidi on 2018-05-09.
//  Copyright © 2018 Daniel Saidi. All rights reserved.

import UIKit

public extension UIView {
    
    public func applyShadow(_ style: ShadowStyle) {
        clipsToBounds = false
        layer.applyShadow(
            color: style.color,
            alpha: style.alpha,
            x: style.x,
            y: style.y,
            blur: style.blur,
            spread: style.spread)
    }
}

fileprivate extension CALayer {
    
    func applyShadow(
        color: UIColor = .black,
        alpha: Float = 0.5,
        x: CGFloat = 0,
        y: CGFloat = 2,
        blur: CGFloat = 4,
        spread: CGFloat = 0) {
        shadowColor = color.cgColor
        shadowOpacity = alpha
        shadowOffset = CGSize(width: x, height: y)
        shadowRadius = blur / 2.0
        shouldRasterize = true
        rasterizationScale = UIScreen.main.scale
        if spread == 0 {
            shadowPath = nil
        } else {
            let dx = -spread
            let rect = bounds.insetBy(dx: dx, dy: dx)
            shadowPath = UIBezierPath(rect: rect).cgPath
        }
    }
}
