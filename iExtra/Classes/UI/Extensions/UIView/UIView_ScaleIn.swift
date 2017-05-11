//
//  UIView_ScaleIn.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-03-14.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import UIKit

public extension UIView {
    
    public func scaleInWithBounce(duration: TimeInterval) {
        let animation = CAKeyframeAnimation(keyPath: "transform.scale")
        animation.values = [0.5, 1.1, 0.8, 1.0]
        animation.duration = duration
        animation.isRemovedOnCompletion = true
        layer.add(animation, forKey: "scaleIn")
        layer.transform = CATransform3DIdentity
    }
}
