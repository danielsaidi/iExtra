//
//  UIView+Rotate.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-03-15.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import UIKit

public extension UIView {
    
    public func rotate(withRadians radians: CGFloat, duration: TimeInterval, options: UIViewAnimationOptions, completion: ((_ completed: Bool) -> ())? = nil) {
        let anims = { self.transform = self.transform.rotated(by: radians) }
        UIView.animate(withDuration: duration, delay: 0, options: options, animations: anims, completion: completion)
    }
}
