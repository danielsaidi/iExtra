//
//  UIView+Visibility.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-10-11.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import UIKit

public extension UIView {

    var isVisible: Bool {
        get { return !isHidden }
        set { isHidden = !newValue }
    }
    
    func hide() { isHidden = true }
    func show() { isVisible = true }
}
