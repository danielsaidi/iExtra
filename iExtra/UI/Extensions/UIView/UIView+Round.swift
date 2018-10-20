//
//  UIView+Round.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-10-12.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import UIKit

public extension UIView {
    
    func makeRound(withRadius radius: CGFloat) {
        let oldCenter = center
        frame.size.height = radius
        frame.size.width = radius
        layer.cornerRadius = radius / 2.0
        center = oldCenter
    }
    
    
    func makeRoundWithHeightRadius() {
        makeRound(withRadius: frame.size.height)
    }
    
    func makeRoundWithWidthRadius() {
        makeRound(withRadius: frame.size.width)
    }
}
