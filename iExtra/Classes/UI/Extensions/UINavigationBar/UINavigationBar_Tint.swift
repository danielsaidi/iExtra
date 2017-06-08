//
//  UINavigationBar_Tint.swift
//  iExtra
//
//  Created by Daniel Saidi on 2017-05-30.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

import UIKit

public extension UINavigationBar {
    
    public func setContentTintColor(_ color: UIColor?) {
        var attributes = titleTextAttributes ?? [String : Any]()
        attributes[NSForegroundColorAttributeName] = color
        titleTextAttributes = attributes
        tintColor = color
    }
}
