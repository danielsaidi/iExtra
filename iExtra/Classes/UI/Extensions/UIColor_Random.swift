//
//  UIColor_Random.swift
//  iExtra
//
//  Created by Daniel Saidi on 2015-08-18.
//  Copyright (c) 2015 Daniel Saidi. All rights reserved.
//

import UIKit

public extension UIColor {
    
    public class var random: UIColor {
        let red = CGFloat(drand48())
        let green = CGFloat(drand48())
        let blue = CGFloat(drand48())
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
}
