//
//  DelayOperator.swift
//  iExtra
//
//  Created by Daniel Saidi on 2015-01-29.
//  Copyright © 2015 Daniel Saidi. All rights reserved.
//

import Foundation

public func delay(_ delay: Double, _ function: @escaping ()->()) {
    DispatchQueue.main.asyncAfter(
        deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC),
        execute: function)
}
