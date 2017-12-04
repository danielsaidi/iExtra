//
//  UIScrollView+Scroll.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-01-13.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import UIKit

public extension UIScrollView {
    
    public func scrollToBottom(_ animated: Bool) {
        let y = contentSize.height - bounds.size.height
        if (y > 0) {
            let bottom = CGPoint(x: 0, y: y)
            setContentOffset(bottom, animated: animated)
        }
    }
}
