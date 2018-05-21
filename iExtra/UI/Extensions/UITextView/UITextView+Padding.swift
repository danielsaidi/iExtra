//
//  UITextView+Padding.swift
//  iExtra
//
//  Created by Daniel Saidi on 2015-11-07.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

import UIKit

public extension UITextView {
    
    public func removePadding() {
        contentInset = UIEdgeInsets(top: 0, left: -4, bottom: 0, right: 0)
    }
}
