//
//  UIView+Fade.swift
//  iExtra
//
//  Created by Daniel Saidi on 2018-06-10.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

import UIKit

public extension UIView {
    
    public func fade(
        to alpha: CGFloat,
        withDuration duration: TimeInterval,
        completion: ((_ finished: Bool) -> ())? = nil) {
        if self.alpha == alpha { return }
        if alpha == 0 { show() }
        UIView.animate(
            withDuration: duration,
            animations: { self.alpha = alpha },
            completion: { finished in
                if alpha == 0 { self.hide() }
                completion?(finished)
            }
        )
    }
}
