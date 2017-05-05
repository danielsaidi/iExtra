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
    }
    
    public func makeTransparent() {
        guard !isTransparent else { return }
        setBackgroundImage(UIImage(), for: .default)
        shadowImage = UIImage()
    }
    
    public func makeNonTransparent() {
        guard isTransparent else { return }
        setBackgroundImage(nil, for: .default)
        shadowImage = nil
    }
}
