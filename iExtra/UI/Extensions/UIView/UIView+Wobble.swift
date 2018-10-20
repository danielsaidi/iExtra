//
//  UIView+Wobble.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-03-14.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import UIKit

public protocol Wobbly {}

public extension Wobbly where Self: UIView {
    
    private var key: String { return "wobble" }
    
    func startWobble() {
        wobble(Int.max)
    }
    
    func stopWobble() {
        layer.removeAnimation(forKey: key)
    }
    
    func wobble(_ numberOfTimes: Int) {
        let animation = CABasicAnimation(keyPath: "transform.rotation")
        animation.toValue = -Double.pi/128
        animation.fromValue = Double.pi/128
        animation.duration = 0.2
        animation.repeatCount = Float(numberOfTimes)
        animation.autoreverses = true
        layer.add(animation, forKey: key)
    }
}
