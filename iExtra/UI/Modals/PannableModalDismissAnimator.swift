//
//  PannableModalDismissAnimator.swift
//  iExtra
//
//  Created by Daniel Saidi on 2017-04-18.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

import UIKit


// MARK: - PannableModalDismissAnimatorDelegate

protocol PannableModalDismissAnimatorDelegate: class {
    
    func dismissAnimatorDidDismiss(_ animator: PannableModalDismissAnimator)
}


// MARK: - PannableModalDismissAnimator

class PannableModalDismissAnimator: NSObject {
    
    weak var delegate: PannableModalDismissAnimatorDelegate?
}


// MARK: - Private Functions

fileprivate extension PannableModalDismissAnimator {
    
    func getFinalFrame() -> CGRect {
        let bounds = UIScreen.main.bounds
        let bottomLeft = CGPoint(x: 0, y: bounds.height)
        return CGRect(origin: bottomLeft, size: bounds.size)
    }
}


// MARK: - UIViewControllerAnimatedTransitioning

extension PannableModalDismissAnimator: UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let context = transitionContext
        guard let from = context.viewController(forKey: .from) else { return }
        guard let to = context.viewController(forKey: .to) else { return }
        
        let view = context.containerView
        view.addSubview(to.view, fill: true)
        view.sendSubview(toBack: to.view)
        
        let duration = transitionDuration(using: context)
        let animation = { from.view.frame = self.getFinalFrame() }
        UIView.animate(withDuration: duration, animations: animation) { _ in
            let finished = !context.transitionWasCancelled
            context.completeTransition(finished)
            if finished {
                self.delegate?.dismissAnimatorDidDismiss(self)
            }
        }
    }
}
