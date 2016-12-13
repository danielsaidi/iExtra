//
//  Numeric_Random.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-03-08.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import Foundation

public extension Int {
    
    public static func random(in range: ClosedRange<Int>) -> Int {
        let count = UInt32(1 + range.upperBound - range.lowerBound)
        return Int(arc4random_uniform(count)) + range.lowerBound
    }
}

public extension Float {
    
    public static func random(in range: ClosedRange<Int>) -> Float {
        return Float(Int.random(in: range))
    }
}

public extension Double {
    
    public static func random(in range: ClosedRange<Int>) -> Double {
        return Double(Int.random(in: range))
    }
}

public extension CGFloat {
    
    public static func random(in range: ClosedRange<Int>) -> CGFloat {
        return CGFloat(Int.random(in: range))
    }
}
