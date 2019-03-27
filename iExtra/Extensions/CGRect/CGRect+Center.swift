//
//  CGRect+Center.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-03-13.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

import Foundation

public extension CGRect {
    
    var center: CGPoint {
        return CGPoint(x: midX, y: midY)
    }
}
