//
//  UIView+Nib.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-11-09.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

import UIKit

public extension UIView {
    
    
    // MARK: - Properties
    
    static var defaultNib: UINib {
        return defaultNib(in: Bundle.main)
    }
    
    static var defaultNibName: String {
        return String(describing: self)
    }
    
    
    // MARK: - Functions
    
    static func defaultNib(in bundle: Bundle) -> UINib {
        return UINib(nibName: defaultNibName, bundle: bundle)
    }
    
    static func initWithDefaultNib(owner: Any?, in bundle: Bundle = Bundle.main) -> Self {
        return initWithNib(named: defaultNibName, owner: owner, in: bundle)
    }
    
    static func initWithNib<T>(named nibName: String, owner: Any?, in bundle: Bundle = Bundle.main) -> T {
        let nibs = bundle.loadNibNamed(nibName, owner: owner, options: nil)
        guard let nib = nibs?[0] as? T else { fatalError("initWithDefaultNibTyped: Invalid class") }
        return nib
    }
}
