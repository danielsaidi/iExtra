//
//  UIViewController_Root.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-10-16.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import UIKit

public extension UIViewController {

    func navigationRoot() -> UIViewController? {
        guard let nc = self as? UINavigationController else { return self }
        return nc.viewControllers.first
    }
    
    func navigationRoot<T>() -> T? {
        guard let nc = self as? UINavigationController else { return self as? T }
        return nc.viewControllers.first as? T
    }
}
