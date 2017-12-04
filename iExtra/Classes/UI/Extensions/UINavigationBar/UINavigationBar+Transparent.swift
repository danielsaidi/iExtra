//
//  UINavigationBar_Transparent.swift
//  iExtra
//
//  Created by Daniel Saidi on 2015-10-04.
//  Copyright © 2015 Daniel Saidi. All rights reserved.
//

import UIKit

public extension UINavigationBar {
    
    public func makeNonTransparent(withBarShadow shadow: Bool) {
        isTranslucent = false
        setBackgroundImage(shadow ? nil : UIImage(), for: .default)
        shadowImage = shadow ? nil : UIImage()
    }
    
    public func makeTransparent() {
        isTranslucent = true
        setBackgroundImage(UIImage(), for: .default)
        shadowImage = UIImage()
    }
}
