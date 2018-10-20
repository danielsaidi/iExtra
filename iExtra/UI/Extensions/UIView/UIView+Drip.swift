//
//  UIView+DripPulse.swift
//  iExtra
//
//  Created by Daniel Saidi on 2017-03-31.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

import UIKit

public protocol Drippable: Fadeable, Scaleable {}

public extension Drippable where Self: UIView {
    
    private var key: String { return "rippleEffect" }
    
    func startDripPulse(fromScale: Double, toScale: Double, withDuration duration: Double, delay: Double, times: Int) {
        let fadePulse = fadePulseAnimation(fromAlpha: 1, toAlpha: 0, withDuration: duration, times: 1)
        let scalePulse = scalePulseAnimation(fromScale: fromScale, toScale: toScale, withDuration: duration, times: 1)
        
        let pause =  CABasicAnimation(keyPath: "transform.scale")
        pause.duration = delay
        pause.fromValue = toScale
        pause.toValue = toScale
        pause.beginTime = duration
        
        let group = CAAnimationGroup()
        group.duration = duration
        group.repeatCount = Float(times)
        group.animations = [adjustReversingAnimation(fadePulse), adjustReversingAnimation(scalePulse), pause]
        
        layer.add(group, forKey: key)
    }
    
    public func startDripPulse(fromScale: Double, toScale: Double, withDuration duration: Double, delay: Double) {
        startDripPulse(fromScale: fromScale, toScale: toScale, withDuration: duration, delay: delay, times: Int.max)
    }
    
    public func stopDripPulse() {
        layer.removeAnimation(forKey: key)
    }
}

private extension UIView {

    func adjustReversingAnimation(_ anim: CABasicAnimation) -> CABasicAnimation {
        anim.autoreverses = false
        anim.duration *= 2
        return anim
    }
}
