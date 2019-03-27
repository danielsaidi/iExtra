//
//  Numeric+Format.swift
//  iExtra
//
//  Created by Daniel Saidi on 2015-11-15.
//  Copyright © 2015 Daniel Saidi. All rights reserved.
//

import UIKit

public extension CGFloat {
    
    func format(withDecimals decimals: Int) -> String {
        let format = "0.\(decimals)"
        return String(format: "%\(format)f", self)
    }
}


public extension Double {
    
    func format(withDecimals decimals: Int) -> String {
        let format = "0.\(decimals)"
        return String(format: "%\(format)f", self)
    }
}


public extension Float {
    
    func format(withDecimals decimals: Int) -> String {
        let format = "0.\(decimals)"
        return String(format: "%\(format)f", self)
    }
}
