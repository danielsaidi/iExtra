//
//  UIViewController+Nib.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-11-09.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import UIKit

public extension UIViewController {
    
    public static var defaultNib: UINib {
        return UINib(nibName: className, bundle: nil)
    }
}
