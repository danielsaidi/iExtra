//
//  SlidingViewControllerTransition.swift
//  iExtra
//
//  Created by Daniel Saidi on 2015-08-21.
//  Copyright © 2015 Daniel Saidi. All rights reserved.
//

import Foundation

open class SlidingViewControllerTransition: NSObject, UIViewControllerAnimatedTransitioning {
    
    
    // MARK: - Initialization
    
    public init(duration: Double = 0.2, vector: CGPoint = CGPoint(x: 5, y: 0), isForward: Bool) {
        self.duration = duration
        self.isForward = isForward
        self.vector = vector
        super.init()
    }
    
    
    // MARK: - Properties
    
    var duration: Double
    var isForward: Bool
    var vector: CGPoint
    
    
    // MARK: - Public functions
    
    open func transitionDuration(using context: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    open func animateTransition(using context: UIViewControllerContextTransitioning) {
        let from = context.viewController(forKey: .from)
        let to = context.viewController(forKey: .to)
        guard let fromView = from?.view, let toView = to?.view else { return }
        
        let container = context.containerView
        let xoffset = CGFloat(isForward ? vector.x : -vector.x)
        let yoffset = CGFloat(isForward ? vector.y : -vector.y)
        
        toView.alpha = 0.0
        toView.frame = toView.frame.offsetBy(dx: xoffset, dy: yoffset)
        container.addSubview(toView)
        
        let animations = {
            toView.alpha = 1.0
            toView.frame = toView.frame.offsetBy(dx: -xoffset, dy: -yoffset)
        }
        
        UIView.animate(withDuration: duration, animations: animations) { finished in
            fromView.removeFromSuperview()
            context.completeTransition(finished)
        }
    }
}
