//
//  UINavigationBar+TitleAlpha.swift
//  iExtra
//
//  Created by Daniel Saidi on 2017-01-10.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

import UIKit

public extension UINavigationBar {
    
    func setTitleAlpha(_ alpha: CGFloat) {
        var attributes = titleTextAttributes ?? [NSAttributedString.Key: Any]()
        var color: UIColor = attributes[.foregroundColor] as? UIColor ?? .black
        color = color.withAlphaComponent(alpha)
        attributes[.foregroundColor] = color
        titleTextAttributes = attributes
    }
}
