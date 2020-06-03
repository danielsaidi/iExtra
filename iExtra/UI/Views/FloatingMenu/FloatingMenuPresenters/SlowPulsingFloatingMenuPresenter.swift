//
//  SlowPulsingFloatingMenuPresenter.swift
//  iExtra
//
//  Created by Daniel Saidi on 2015-02-09.
//  Copyright © 2015 Daniel Saidi. All rights reserved.
//

/*
    This floating menu presenter presents the menu in an
    amazingly slow-pulsing fashion. Enjoy.
*/

import UIKit

open class SlowPulsingFloatingMenuPresenter: NSObject, FloatingMenuPresenter {
    
    open var presentationDuration = 0.8
    
    open func present(menu: FloatingMenu, completion: @escaping (() -> ())) {
        let scale = CGFloat(0.01)
        let transform = CATransform3DMakeScale(scale, scale, 1.0)
        menu.isHidden = false
        menu.layer.transform = transform
        menu.layer.add(getAnimation(withScale: scale), forKey: "scaleIn")
        menu.layer.transform = CATransform3DIdentity
        delay(seconds: presentationDuration) { completion() }
    }
}

private extension SlowPulsingFloatingMenuPresenter {
    
    func delay(seconds: TimeInterval, function: @escaping ()->()) {
        let milliseconds = Int(seconds * 1000)
        let interval: DispatchTimeInterval = .milliseconds(milliseconds)
        DispatchQueue.main.asyncAfter(deadline: .now() + interval, execute: function)
    }
    
    func getAnimation(withScale scale: CGFloat) -> CAKeyframeAnimation {
        let animation = CAKeyframeAnimation(keyPath: "transform.scale")
        animation.values = [scale, 1.1, 0.8, 1.0]
        animation.duration = presentationDuration
        animation.isRemovedOnCompletion = true
        return animation
    }
}
