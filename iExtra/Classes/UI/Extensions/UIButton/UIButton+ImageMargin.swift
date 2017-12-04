//
//  UIButton+ImageMargin.swift
//  iExtra
//
//  Created by Daniel Saidi on 2017-03-21.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

import UIKit

public extension UIButton {
    
    public func setImageMargin(_ margin: CGFloat, withEdgePadding padding: CGFloat) {
        let inset = margin / 2
        imageEdgeInsets.left = -inset
        imageEdgeInsets.right = inset
        titleEdgeInsets.left = inset
        titleEdgeInsets.right = -inset
        contentEdgeInsets.left = padding + inset
        contentEdgeInsets.right = padding + inset
    }
}
