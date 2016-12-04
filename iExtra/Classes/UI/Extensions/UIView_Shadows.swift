//
//  UIView_Shadows.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-10-12.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import UIKit

public extension UIView {

    public func applyBadgeShadow() {
        layer.shadowOffset = CGSize(width: 1, height: 1)
        layer.shadowRadius = 1
        layer.shadowOpacity = 0.5
        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.main.scale
    }
    
    public func applyShadow(withOffset offset: CGSize, radius: CGFloat, opacity: Float) {
        layer.shadowOffset = offset
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity
        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.main.scale
    }
    
    public func removeShadow() {
        layer.shadowOpacity = 0
    }
}
