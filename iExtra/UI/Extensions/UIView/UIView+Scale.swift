//
//  UIView+Scale.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-03-14.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import UIKit

public protocol Scaleable {}

public extension Scaleable where Self: UIView {
    
    private var key: String { return "scalePulse" }
    
    func scale(withFactor factor: CGFloat, seconds: TimeInterval, options: UIView.AnimationOptions, completion: ((_ finished: Bool) -> ())?) {
        let size = frame.size
        let newCenter = center
        let newWidth = size.width * factor
        let newHeight = size.height * factor
        let newFrame = CGRect(x: 0, y: 0, width: newWidth, height: newHeight)
        let anims = {
            self.frame = newFrame
            self.center = newCenter
        }
        UIView.animate(withDuration: seconds, delay: 0, options: options, animations: anims, completion: completion)
    }
    
    func scaleInWithBounce(duration: TimeInterval) {
        let animation = CAKeyframeAnimation(keyPath: "transform.scale")
        animation.values = [0.5, 1.1, 0.8, 1.0]
        animation.duration = duration
        animation.isRemovedOnCompletion = true
        layer.add(animation, forKey: "scaleIn")
        layer.transform = CATransform3DIdentity
    }
    
    func scalePulse(fromScale: Double, toScale: Double, withDuration duration: Double, times: Int) {
        let pulse = scalePulseAnimation(fromScale: fromScale, toScale: toScale, withDuration: duration, times: times)
        layer.add(pulse, forKey: key)
    }
    
    func scalePulseAnimation(fromScale: Double, toScale: Double, withDuration duration: Double, times: Int) -> CABasicAnimation {
        let pulse = CABasicAnimation(keyPath: "transform.scale")
        pulse.duration = duration / 2
        pulse.fromValue = fromScale
        pulse.toValue = toScale
        pulse.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        pulse.autoreverses = true
        pulse.repeatCount = Float(times)
        return pulse
    }
    
    func startScalePulse(fromScale: Double, toScale: Double, withDuration duration: Double) {
        scalePulse(fromScale: fromScale, toScale: toScale, withDuration: duration, times: Int.max)
    }
    
    func stopScalePulse() {
        layer.removeAnimation(forKey: key)
    }
}
