//
//  UIView+AnimatedTap.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-01-25.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

import UIKit

public extension UIView {
    
    public func animateDefaultPress(factor: CGFloat = 0.8, completion: (() -> ())? = nil) {
        let transform = CGAffineTransform(scaleX: factor, y: factor)
        animateTransform(transform, completion: completion)
    }
    
    public func animateDefaultRelease(completion: (() -> ())? = nil) {
        animateTransform(.identity, completion: completion)
    }
    
    public func animateDefaultTap(completion: (() -> ())? = nil) {
        animateDefaultPress { [weak self] in
            self?.animateDefaultRelease(completion: completion)
        }
    }
}

fileprivate extension UIView {
    
    func animateTransform(_ transform: CGAffineTransform, completion: (() -> ())? = nil) {
        UIView.animate(
            withDuration: 0.123,
            delay: 0,
            options: [.curveEaseOut],
            animations: { [weak self] in self?.transform = transform },
            completion: { _ in completion?() }
        )
    }
}
