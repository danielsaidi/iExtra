//
//  ParallaxEffectDefault.swift
//  iExtra
//
//  Created by Daniel Saidi on 2015-01-19.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

import Foundation

public class ParallaxEffectDefault: NSObject, ParallaxEffect {
    
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
        for effect in view.motionEffects {
            view.removeMotionEffect(effect)
        }
        
        guard let groups = view.motionEffects as? [UIMotionEffectGroup] else { return }
        for effect in groups {
            view.removeMotionEffect(effect)
        }
    }
}
