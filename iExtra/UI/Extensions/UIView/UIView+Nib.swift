//
//  UIView+Nib.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-11-09.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

import UIKit

public extension UIView {
    
    static var defaultNib: UINib {
        return defaultNib()
    }
    
    static var defaultNibName: String {
        return String(describing: self)
    }
    
    static func defaultNib(in bundle: Bundle = .main) -> UINib {
        return UINib(nibName: defaultNibName, bundle: bundle)
    }
    
    static func fromNib(
        owner: Any?,
        named nibName: String = defaultNibName,
        in bundle: Bundle = .main) -> Self {
        return fromNibTyped(owner: owner)
    }
    
    static func fromNibTyped<T: UIView>(
        owner: Any?,
        named nibName: String = T.defaultNibName,
        in bundle: Bundle = .main) -> T {
        let nibs = bundle.loadNibNamed(nibName, owner: owner, options: nil)
        guard let nib = nibs?[0] as? T else { fatalError("initWithDefaultNib failed") }
        return nib
    }
}
