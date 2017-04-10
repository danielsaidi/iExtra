//
//  UIView_Nib.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-11-09.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import UIKit


public extension UIView {
    
    
    // MARK: - Static Properties
    
    public static var defaultNib: UINib {
        return UINib(nibName: defaultNibName, bundle: nil)
    }
    
    public static var defaultNibName: String {
        return className
    }
    
    
    // MARK: - Static Functions
    
    public static func initWithDefaultNib(owner: Any) -> Self {
        return initWithDefaultNibTyped(owner: owner)
    }
    
    public static func initWithDefaultNibTyped<T>(owner: Any) -> T {
        let bundle = Bundle.main
        let nib = defaultNibName
        let nibs = bundle.loadNibNamed(nib, owner: owner, options: nil)
        return nibs?[0] as! T
    }
}
