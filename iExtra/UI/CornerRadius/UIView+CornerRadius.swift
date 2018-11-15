//
//  UIView+CornerRadius.swift
//  iExtra
//
//  Created by Daniel Saidi on 2018-05-09.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

import UIKit

public extension UIView {
    
    func applyCornerRadius(_ radius: CornerRadius, clipsToBounds: Bool = true) {
        self.clipsToBounds = clipsToBounds
        layer.cornerRadius = CGFloat(radius.radius)
    }
    
    func applyCornerRadius(_ radius: CornerRadius, to corners: UIRectCorner, fillColor: UIColor? = nil) {
        if #available(iOS 11.0, *) {
            layer.maskedCorners = rectCornersToMaskedCorners(corners)
            applyCornerRadius(radius)
            if let fillColor = fillColor { backgroundColor = fillColor }
        } else {
            let maskRadii = CGSize(width: radius.radius, height: radius.radius)
            let maskPath = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: maskRadii)
            let maskLayer = CAShapeLayer()
            maskLayer.path = maskPath.cgPath
            if let fillColor = fillColor { maskLayer.fillColor = fillColor.cgColor }
            layer.mask = maskLayer
        }
    }
}

private extension UIView {
    
    func rectCornersToMaskedCorners(_ corners: UIRectCorner) -> CACornerMask {
        var mask = CACornerMask()
        if corners.contains(.topLeft) { mask = mask.union(.layerMinXMinYCorner) }
        if corners.contains(.bottomLeft) { mask = mask.union(.layerMinXMaxYCorner) }
        if corners.contains(.topRight) { mask = mask.union(.layerMaxXMinYCorner) }
        if corners.contains(.bottomRight) { mask = mask.union(.layerMaxXMaxYCorner) }
        return mask
    }
}
