//
//  StandardParallaxEffect.swift
//  iExtra
//
//  Created by Daniel Saidi on 2015-01-19.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

import Foundation

public class StandardParallaxEffect: NSObject, ParallaxEffect {
    
    public func addParallaxEffect(to view: UIView, maxOffset: Int) {
        removeParallaxEffect(from: view)
        
        let vertical = UIInterpolatingMotionEffect(keyPath: "center.y", type: .tiltAlongVerticalAxis)
        vertical.minimumRelativeValue = -maxOffset
        vertical.maximumRelativeValue = maxOffset
        
        let horizontal = UIInterpolatingMotionEffect(keyPath: "center.x", type: .tiltAlongHorizontalAxis)
        horizontal.minimumRelativeValue = -maxOffset
        horizontal.maximumRelativeValue = maxOffset
        
        let effectGroup: UIMotionEffectGroup = UIMotionEffectGroup()
        effectGroup.motionEffects = [horizontal, vertical]
        
        view.addMotionEffect(effectGroup)
    }
    
    public func removeParallaxEffect(from view: UIView) {
        view.motionEffects.forEach {
            view.removeMotionEffect($0)
        }
        
        let groups = view.motionEffects as? [UIMotionEffectGroup]
        groups?.forEach {
            view.removeMotionEffect($0)
        }
    }
}
