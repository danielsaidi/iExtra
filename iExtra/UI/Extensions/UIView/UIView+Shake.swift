//
//  UIView+Shake.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-03-14.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import UIKit

public extension UIView {
    
    private var key: String { return "shake" }
    
    public func shake() {
        shake(numberOfTimes: 1)
    }
    
    public func shake(numberOfTimes times: Int) {
        shake(withRadians: Double.pi/256.0, duration: 0.1, times: times)
    }
    
    public func shake(withRadians radians: Double, duration: TimeInterval, times: Int) {
        let animation = CABasicAnimation(keyPath: "transform.rotation")
        animation.toValue = -radians
        animation.fromValue = radians
        animation.duration = duration
        animation.repeatCount = Float(times)
        animation.autoreverses = true
        layer.add(animation, forKey: key)
    }
    
    public func startShake() {
        shake(numberOfTimes: Int.max)
    }
    
    public func startShake(withRadians radians: Double, duration: TimeInterval) {
        shake(withRadians: radians, duration: duration, times: Int.max)
    }
    
    public func stopShake() {
        layer.removeAnimation(forKey: key)
    }
}
