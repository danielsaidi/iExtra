//
//  UIViewController+Nib.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-11-09.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import UIKit

public extension UIViewController {
    
    
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
}
