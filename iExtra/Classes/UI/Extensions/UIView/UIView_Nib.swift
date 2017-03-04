//
//  UIView_Nib.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-11-09.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import UIKit


public extension UIView {
    
    public static var defaultNib: UINib {
        return UINib(nibName: defaultNibName, bundle: nil)
    }
    
    public static var defaultNibName: String {
        return className
    }
    
    public static func loadNib(owner: Any) -> Any? {
        print("UIView loadNib(owner: Any) is deprecated")
        return initWithDefaultNib(owner: owner)
    }
    
    public static func initWithDefaultNib(owner: Any) -> Any? {
        return Bundle.main.loadNibNamed(defaultNibName, owner: owner, options: nil)?[0]
    }
}
