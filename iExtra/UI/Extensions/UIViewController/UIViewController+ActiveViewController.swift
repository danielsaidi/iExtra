//
//  UIViewController+ActiveViewController.swift
//  iExtra
//
//  Created by Daniel Saidi on 2018-08-06.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

import UIKit

public extension UIViewController {
    
    var activeViewController: UIViewController? {
        
        if let nc = self as? UINavigationController {
            return nc.visibleViewController?.activeViewController
        }
        
        if let tab = self as? UITabBarController {
            return tab.selectedViewController?.activeViewController ?? tab.activeViewController
        }
        
        return presentedViewController?.activeViewController ?? self
    }
}
