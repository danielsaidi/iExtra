//
//  UITextView+Padding.swift
//  iExtra
//
//  Created by Daniel Saidi on 2015-11-07.
//  Copyright © 2015 Daniel Saidi. All rights reserved.
//

import UIKit

public extension UITextView {
    
    public func removePadding() {
        contentInset = UIEdgeInsetsMake(0, -4, 0, 0)
    }
}
