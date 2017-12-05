//
//  UIEdgeInset+Init.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-11-09.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import UIKit

public extension UIEdgeInsets {
    
    public init(bottom: CGFloat) {
        self.init(top: 0, left: 0, bottom: bottom, right: 0)
    }
    
    public init(left: CGFloat) {
        self.init(top: 0, left: left, bottom: 0, right: 0)
    }
    
    public init(right: CGFloat) {
        self.init(top: 0, left: 0, bottom: 0, right: right)
    }
    
    public init(top: CGFloat) {
        self.init(top: top, left: 0, bottom: 0, right: 0)
    }
}
