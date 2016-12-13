//
//  Float_Format.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-12-12.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import Foundation

public extension Float {
    
    public func format(_ format: String = "0.2") -> String {
        return String(format: "%\(format)f", self)
    }
    
    public func format(withDecimals decimals: Int) -> String {
        return format("0.\(decimals)")
    }
}
