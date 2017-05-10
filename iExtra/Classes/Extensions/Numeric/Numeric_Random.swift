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
    
    public static func random(in range: ClosedRange<Double>) -> Float {
        return Float(Double.random(in: range))
    }
}

public extension Double {
    
    public static func random(in range: ClosedRange<Double>) -> Double {
        return Double(arc4random()) / Double(UINT32_MAX) * Swift.abs(range.upperBound - range.lowerBound) + min(range.lowerBound, range.upperBound)
    }
}

public extension CGFloat {
    
    public static func random(in range: ClosedRange<Double>) -> CGFloat {
        return CGFloat(Double.random(in: range))
    }
}
