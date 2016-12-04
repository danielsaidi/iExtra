//
//  FadingViewControllerTransition.swift
//  iExtra
//
//  Created by Daniel Saidi on 2015-08-21.
//  Copyright © 2015 Daniel Saidi. All rights reserved.
//

import UIKit

open class FadingViewControllerTransition: NSObject, UIViewControllerAnimatedTransitioning {
    
    
    // MARK: - Initialization
    
    public init (duration: Double = 0.2) {
        self.duration = duration
        super.init()
    }
    
    
    
    // MARK: - Properties
    
    var duration: Double
    
    
    
    // MARK: - Public functions
    
    open func transitionDuration(using context: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    open func animateTransition(using context: UIViewControllerContextTransitioning) {
        
        let from = context.viewController(forKey: .from)
        let to = context.viewController(forKey: .to)
        guard let fromView = from?.view, let toView = to?.view else { return }
        
        let container = context.containerView
        
        toView.alpha = 0.0
        container.addSubview(toView)
        let animations = { toView.alpha = 1.0 }
        
        UIView.animate(withDuration: duration, animations: animations) { finished in
            fromView.removeFromSuperview()
            context.completeTransition(finished)
        }
    }
}
