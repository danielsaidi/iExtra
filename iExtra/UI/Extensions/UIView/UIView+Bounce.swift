//
//  UIView+Bounce.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-01-25.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

import UIKit

public extension UIView {

    public func bounce(withFactor factor: CGFloat) {
        
        let midHeight = frame.size.height * factor
        let kNumFactors = CGFloat(22.0)
        let kFactorsPerSec = CGFloat(30.0)
        let kFactorsMaxValue = 128.0
        let factors = [0, 60, 83, 100, 114, 124, 128, 128, 124, 114, 100, 83, 60, 32, 0, 0, 18, 28, 32, 28, 18, 0]
        
        var transforms = [NSValue]()
        for index in 1...Int(kNumFactors) {
            let offset  = CGFloat(factors[index-1]) / CGFloat(kFactorsMaxValue) * midHeight
            let transform = CATransform3DMakeTranslation(0.0, -offset, 0.0)
            transforms.append(NSValue(caTransform3D: transform))
        }
        
        let animation = CAKeyframeAnimation(keyPath: "transform")
        animation.repeatCount = 1
        animation.duration = CFTimeInterval(kNumFactors * CGFloat(1.0) / kFactorsPerSec)
        animation.fillMode = CAMediaTimingFillMode.forwards
        animation.values = transforms
        animation.isRemovedOnCompletion = true
        animation.autoreverses = false
        
        layer.add(animation, forKey: "bouncing")
    }
}
