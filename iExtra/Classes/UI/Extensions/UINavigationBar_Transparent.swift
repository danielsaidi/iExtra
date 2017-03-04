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
        UIView.animate(withDuration: 0.3) {
            self.setBackgroundImage(barShadow ? nil : UIImage(), for: .default)
            self.shadowImage = barShadow ? nil : UIImage()
        }
    }
    
    public func makeTransparent() {
        UIView.animate(withDuration: 0.3) {
            self.setBackgroundImage(UIImage(), for: .default)
            self.shadowImage = UIImage()
        }
    }
}
