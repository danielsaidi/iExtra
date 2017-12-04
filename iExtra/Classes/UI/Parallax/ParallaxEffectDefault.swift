//
//  ParallaxEffectDefault.swift
//  iExtra
//
//  Created by Daniel Saidi on 2015-01-19.
//  Copyright © 2015 Daniel Saidi. All rights reserved.
//

import Foundation

public class ParallaxEffectDefault: NSObject, ParallaxEffect {
    
    public func addParallaxEffect(to view: UIView, maxOffset: Int) {
        removeParallaxEffect(from: view)
        
        let verticalEffect : UIInterpolatingMotionEffect =
            UIInterpolatingMotionEffect(keyPath: "center.y", type: .tiltAlongVerticalAxis)
        verticalEffect.minimumRelativeValue = -maxOffset
        verticalEffect.maximumRelativeValue = maxOffset
        
        let horizontalEffect : UIInterpolatingMotionEffect =
            UIInterpolatingMotionEffect(keyPath: "center.x", type: .tiltAlongHorizontalAxis)
        horizontalEffect.minimumRelativeValue = -maxOffset
        horizontalEffect.maximumRelativeValue = maxOffset
        
        let effectGroup : UIMotionEffectGroup = UIMotionEffectGroup()
        effectGroup.motionEffects = [horizontalEffect, verticalEffect]
        
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
