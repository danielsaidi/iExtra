//
//  UINavigationBar_TitleAlpha.swift
//  iExtra
//
//  Created by Daniel Saidi on 2017-01-10.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

import UIKit

public extension UINavigationBar {
    
    public func setTitleAlpha(_ alpha: CGFloat) {
        var attributes = titleTextAttributes ?? [String : Any]()
        var color: UIColor = attributes[NSForegroundColorAttributeName] as? UIColor ?? .black
        color = color.withAlphaComponent(alpha)
        attributes[NSForegroundColorAttributeName] = color
        titleTextAttributes = attributes
    }
}
