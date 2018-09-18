//
//  UIView+ScalePulse.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-03-15.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import UIKit

public extension UIView {
    
    private var key: String { return "scalePulse" }
    
    public func scalePulse(fromScale: Double, toScale: Double, withDuration duration: Double, times: Int) {
        let pulse = scalePulseAnimation(fromScale: fromScale, toScale: toScale, withDuration: duration, times: times)
        layer.add(pulse, forKey: key)
    }
    
    public func scalePulseAnimation(fromScale: Double, toScale: Double, withDuration duration: Double, times: Int) -> CABasicAnimation {
        let pulse = CABasicAnimation(keyPath: "transform.scale")
        pulse.duration = duration / 2
        pulse.fromValue = fromScale
        pulse.toValue = toScale
        pulse.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        pulse.autoreverses = true
        pulse.repeatCount = Float(times)
        return pulse
    }
    
    public func startScalePulse(fromScale: Double, toScale: Double, withDuration duration: Double) {
        scalePulse(fromScale: fromScale, toScale: toScale, withDuration: duration, times: Int.max)
    }
    
    public func stopScalePulse() {
        layer.removeAnimation(forKey: key)
    }
}
