//
//  UIView_HitTests.swift
//  iExtra
//
//  Created by Daniel Saidi Daniel on 2016-12-12.
//  Copyright © 2016 Bonnierförlagen. All rights reserved.
//

import UIKit

extension UISlider {
    
    public func point(insideButton point: CGPoint, withPadding padding: CGSize, andEvent event: UIEvent?) -> Bool {
        let position = buttonPosition.rounded()
        let padding = padding.width.rounded()
        let pointX = point.x.rounded()
        let buttonSize = self.buttonSize
        let minX = position - padding - buttonSize / 2
        let maxX = position + padding + buttonSize / 2
        return pointX >= minX && pointX <= maxX
    }
}
