//
//  UINavigationBar+Tint.swift
//  iExtra
//
//  Created by Daniel Saidi on 2017-05-30.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

import UIKit

public extension UINavigationBar {
    
    public func setContentTintColor(_ color: UIColor?) {
        var attributes = titleTextAttributes ?? [NSAttributedStringKey: Any]()
        attributes[.foregroundColor] = color
        titleTextAttributes = attributes
        tintColor = color
    }
}
