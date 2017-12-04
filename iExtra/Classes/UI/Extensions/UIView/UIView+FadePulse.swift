//
//  UIView+FadePulse.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-03-15.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import UIKit

public extension UIView {
    
    private var key: String { return "fadePulse" }
    
    public func fadePulse(fromAlpha: Double, toAlpha: Double, withDuration duration: Double, times: Int) {
        let pulse = fadePulseAnimation(fromAlpha: fromAlpha, toAlpha: toAlpha, withDuration: duration, times: times)
        layer.add(pulse, forKey: key)
    }
    
    public func fadePulseAnimation(fromAlpha: Double, toAlpha: Double, withDuration duration: Double, times: Int) -> CABasicAnimation {
        let pulse = CABasicAnimation(keyPath: "opacity")
        pulse.duration = duration / 2
        pulse.fromValue = fromAlpha
        pulse.toValue = toAlpha
        pulse.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        pulse.autoreverses = true
        pulse.repeatCount = Float(times)
        return pulse
    }
    
    public func startFadePulse(fromAlpha: Double, toAlpha: Double, withDuration duration: Double) {
        fadePulse(fromAlpha: fromAlpha, toAlpha: toAlpha, withDuration: duration, times: Int.max)
    }
    
    public func stopFadePulse() {
        layer.removeAnimation(forKey: key)
    }
}
