//
//  UIView+Shake.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-03-14.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import UIKit

public protocol Shakeable {}

public extension Shakeable where Self: UIView {
    
    private var key: String { return "shake" }
    
    func shake() {
        shake(numberOfTimes: 1)
    }
    
    func shake(numberOfTimes times: Int) {
        shake(withRadians: Double.pi/256.0, duration: 0.1, times: times)
    }
    
    func shake(withRadians radians: Double, duration: TimeInterval, times: Int) {
        let animation = CABasicAnimation(keyPath: "transform.rotation")
        animation.toValue = -radians
        animation.fromValue = radians
        animation.duration = duration
        animation.repeatCount = Float(times)
        animation.autoreverses = true
        layer.add(animation, forKey: key)
    }
    
    func startShake() {
        shake(numberOfTimes: Int.max)
    }
    
    func startShake(withRadians radians: Double, duration: TimeInterval) {
        shake(withRadians: radians, duration: duration, times: Int.max)
    }
    
    func stopShake() {
        layer.removeAnimation(forKey: key)
    }
}
