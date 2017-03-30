//
//  UIView_FadePulse.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-03-15.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import UIKit

public extension UIView {
    
    fileprivate var key: String { return "fadePulse" }
    
    public func fadePulse(fromAlpha: Double, toAlpha: Double, withDuration duration: Double, times: Int) {
        let pulse = CABasicAnimation(keyPath: "opacity")
        pulse.duration = duration
        pulse.fromValue = fromAlpha
        pulse.toValue = toAlpha
        pulse.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        pulse.autoreverses = true
        pulse.repeatCount = Float(times)
        layer.add(pulse, forKey: key)
    }
    
    public func startFadePulse(fromAlpha: Double, toAlpha: Double, withDuration duration: Double) {
        fadePulse(fromAlpha: fromAlpha, toAlpha: toAlpha, withDuration: duration, times: Int.max)
    }
    
    public func stopFadePulse() {
        layer.removeAnimation(forKey: key)
    }
}
