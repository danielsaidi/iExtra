//
//  UIView+Rotate.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-03-15.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import UIKit

public protocol Rotatable {}

public extension Rotatable where Self: UIView {
    
    private var key: String { return "rotation" }
    
    func rotate(
        withRadians radians: CGFloat,
        duration: TimeInterval,
        options: UIView.AnimationOptions,
        completion: ((_ completed: Bool) -> ())? = nil) {
        UIView.animate(
            withDuration: duration,
            delay: 0,
            options: options,
            animations: { self.transform = self.transform.rotated(by: radians) },
            completion: completion
        )
    }
    
    func rotate360(withDuration duration: Double, times: Int) {
        let animation = rotate360Animation(withDuration: duration, times: times)
        layer.add(animation, forKey: key)
    }
    
    func startRotation(withDuration duration: Double) {
        rotate360(withDuration: duration, times: Int.max)
    }
    
    func stopRotation() {
        layer.removeAnimation(forKey: key)
    }
}

private extension UIView {
    
    func rotate360Animation(withDuration duration: Double, times: Int) -> CABasicAnimation {
        let animation = CABasicAnimation(keyPath: "transform.rotation")
        animation.duration = duration
        animation.fromValue = 0
        animation.toValue = CGFloat(2*Double.pi)
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        animation.autoreverses = false
        animation.repeatCount = Float(times)
        return animation
    }
}
