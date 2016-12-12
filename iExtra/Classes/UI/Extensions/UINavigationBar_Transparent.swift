//
//  UINavigationBar_Transparent.swift
//  iExtra
//
//  Created by Daniel Saidi on 2015-10-04.
//  Copyright © 2015 Daniel Saidi. All rights reserved.
//

import UIKit

public extension UINavigationBar {
    
    public func makeNonTransparent(withBarShadow barShadow: Bool = true) {
        isTranslucent = false
        setBackgroundImage(barShadow ? nil : UIImage(), for: .default)
        shadowImage = barShadow ? nil : UIImage()
    }
    
    public func makeTransparent() {
        isTranslucent = true
        setBackgroundImage(UIImage(), for: .default)
        shadowImage = UIImage()
    }
}
