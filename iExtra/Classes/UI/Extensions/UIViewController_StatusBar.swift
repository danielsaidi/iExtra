//
//  UIViewController_StatusBar.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-11-22.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import UIKit

public extension UIViewController {
    
    public var statusBarStyle: UIStatusBarStyle {
        get { return UIApplication.shared.statusBarStyle }
        set { UIApplication.shared.statusBarStyle = newValue }
    }
    
    
    public func hideStatusBar() {
        UIApplication.shared.setStatusBarHidden(true, with: .none)
    }
    
    public func showStatusBar() {
        UIApplication.shared.setStatusBarHidden(false, with: .none)
    }
}


