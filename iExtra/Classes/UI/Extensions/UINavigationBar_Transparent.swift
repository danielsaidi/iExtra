//
//  UINavigationBar_Transparent.swift
//  iExtra
//
//  Created by Daniel Saidi on 2015-10-04.
//  Copyright © 2015 Daniel Saidi. All rights reserved.
//

import UIKit

public extension UINavigationBar {
    
    public var isTransparent: Bool {
        get { return shadowImage != nil }
        set { newValue ? makeTransparent() : makeNonTransparent() }
    }
    
    
    public func makeNonTransparent() {
        setBackgroundImage(nil, for: .default)
        shadowImage = nil
    }
    
    public func makeTransparent() {
        setBackgroundImage(UIImage(), for: .default)
        shadowImage = UIImage()
    }
}
