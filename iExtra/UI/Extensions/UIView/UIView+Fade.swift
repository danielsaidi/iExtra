//
//  UIView+Fade.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-03-15.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import UIKit

public protocol Fadeable {}

public extension Fadeable where Self: UIView {
    
    private var key: String { return "fadePulse" }
    
    func fade(
        to alpha: CGFloat,
        withDuration duration: TimeInterval,
        completion: ((_ finished: Bool) -> ())? = nil) {
        if self.alpha == alpha { return }
        if self.alpha == 0 { show() }
        UIView.animate(
            withDuration: duration,
            animations: { self.alpha = alpha },
            completion: { finished in
                if alpha == 0 { self.hide() }
                completion?(finished)
            }
        )
    }
    
    func fadePulse(fromAlpha: Double, toAlpha: Double, withDuration duration: Double, times: Int) {
        let pulse = fadePulseAnimation(fromAlpha: fromAlpha, toAlpha: toAlpha, withDuration: duration, times: times)
        layer.add(pulse, forKey: key)
    }
    
    func fadePulseAnimation(fromAlpha: Double, toAlpha: Double, withDuration duration: Double, times: Int) -> CABasicAnimation {
        let pulse = CABasicAnimation(keyPath: "opacity")
        pulse.duration = duration / 2
        pulse.fromValue = fromAlpha
        pulse.toValue = toAlpha
        pulse.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        pulse.autoreverses = true
        pulse.repeatCount = Float(times)
        return pulse
    }
    
    func startFadePulse(fromAlpha: Double, toAlpha: Double, withDuration duration: Double) {
        fadePulse(fromAlpha: fromAlpha, toAlpha: toAlpha, withDuration: duration, times: Int.max)
    }
    
    func stopFadePulse() {
        layer.removeAnimation(forKey: key)
    }
}
