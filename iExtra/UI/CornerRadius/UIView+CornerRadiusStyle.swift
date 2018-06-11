//
//  BaseViewController.swift
//  iExtra
//
//  Created by Daniel Saidi on 2018-05-09.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

import UIKit

public extension UIView {
    
    public func applyCornerRadius(_ style: CornerRadiusStyle, clipsToBounds: Bool = true) {
        self.clipsToBounds = clipsToBounds
        layer.cornerRadius = CGFloat(style.radius)
    }
}
