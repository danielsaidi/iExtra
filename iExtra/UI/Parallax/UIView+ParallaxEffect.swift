//
//  UIView+ParallaxEffect.swift
//  iExtra
//
//  Created by Daniel Saidi on 2018-11-15.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

import UIKit

public extension UIView {
    
    func applyParallaxEffect(_ effect: ParallaxEffect) {
        effect.apply(to: self)
    }
    
    func removeParallaxEffect(_ effect: ParallaxEffect) {
        effect.remove(from: self)
    }
}
