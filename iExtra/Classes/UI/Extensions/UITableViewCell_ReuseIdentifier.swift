//
//  UITableViewCell_ReuseIdentifier.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-11-21.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import UIKit

public extension UITableViewCell {
    
    public static var defaultReuseIdentifier: String {
        
        return className
    }
}
