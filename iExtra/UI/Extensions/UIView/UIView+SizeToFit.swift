//
//  UIView+SizeToFit.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-03-14.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import UIKit

public extension UIView {
    
    func sizeToFitSubviews() {
        let rectUnion = subviews.reduce(CGRect.zero) {
            $0.union($1.frame)
        }
        
        let origin = rectUnion.origin
        subviews.forEach {
            $0.frame.offsetBy(dx: -origin.x, dy: -origin.y)
        }
        
        frame.offsetBy(dx: origin.x, dy: origin.y)
        frame.size = rectUnion.size
    }
}
