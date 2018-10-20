//
//  UIView+HitTests.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-12-12.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import UIKit

public extension UISlider {
    
    func point(insideButton point: CGPoint, withPadding padding: CGSize, andEvent event: UIEvent?) -> Bool {
        let position = buttonPosition.rounded()
        let padding = padding.width.rounded()
        let pointX = point.x.rounded()
        let minX = position - padding - buttonSize / 2
        let maxX = position + padding + buttonSize / 2
        return pointX >= minX && pointX <= maxX
    }
}
