//
//  UINavigationController+StatusBar.swift
//  iExtra
//
//  Created by Daniel Saidi on 2018-04-02.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

/*
 
 This extension must be added to the project. It will not be
 enabled if it only exists in the iExtra framework.
 
 */

import UIKit

extension UINavigationController {
    
    open override var childForStatusBarStyle: UIViewController? {
        return topViewController
    }
}
