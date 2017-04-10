//
//  UIButton_Target.swift
//  iExtra
//
//  Created by Daniel Saidi on 2017-03-17.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

import UIKit

public extension UIButton {
    
    public func addTapTarget(_ target: Any?, action: Selector) {
        addTarget(target, action: action, for: .touchUpInside)
    }
}
