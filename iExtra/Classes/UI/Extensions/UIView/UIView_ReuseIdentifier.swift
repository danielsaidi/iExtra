//
//  UIView_ReuseIdentifier.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-11-18.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

import UIKit

public extension UIView {
    
    public static var defaultReuseIdentifier: String {
        
        return className
    }
}
