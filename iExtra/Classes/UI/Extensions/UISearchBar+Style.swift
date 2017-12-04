//
//  UISearchBar+Style.swift
//  iExtra
//
//  Created by Daniel Saidi on 2017-02-13.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import UIKit

public extension UISearchBar {
    
    public func setTransparentBackground() {
        setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
    }
}
