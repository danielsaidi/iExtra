//
//  UIView_Nib.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-11-09.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//
//

import UIKit


public extension UIView {
    
    public static var defaultNib: UINib {
        return UINib(nibName: defaultNibName, bundle: nil)
    }
    
    public static var defaultNibName: String {
        return className
    }
}
