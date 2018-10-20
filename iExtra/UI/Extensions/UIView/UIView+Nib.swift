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
        return defaultNib(in: Bundle(for: self))
    }
    
    static var defaultNibName: String {
        return className
    }
    
    
    // MARK: - Functions
    
    static func defaultNib(in bundle: Bundle?) -> UINib {
        return UINib(nibName: defaultNibName, bundle: bundle)
    }
    
    static func initWithDefaultNib(owner: Any?) -> Self {
        return initWithDefaultNibTyped(owner: owner, nibName: defaultNibName)
    }
    
    static func initWithDefaultNib(owner: Any?, fileNameSuffix: String) -> Self {
        let nib = "\(defaultNibName)\(fileNameSuffix)"
        return initWithDefaultNibTyped(owner: owner, nibName: nib)
    }
    
    static func initWithDefaultNibTyped<T>(owner: Any?, nibName: String) -> T {
        let bundle = Bundle.main
        let nibs = bundle.loadNibNamed(nibName, owner: owner, options: nil)
        guard let nib = nibs?[0] as? T else { fatalError("initWithDefaultNibTyped: Invalid class") }
        return nib
    }
}
