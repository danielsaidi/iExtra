//
//  UITabBarController+StatusBar.swift
//  iExtra
//
//  Created by Daniel Saidi on 2018-04-02.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

import UIKit

extension UITabBarController {
    
    open override var childViewControllerForStatusBarStyle: UIViewController? {
        return selectedViewController
    }
}
