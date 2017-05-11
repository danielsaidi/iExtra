//
//  CGRect_Center.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-03-13.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import Foundation

public extension CGRect {
    
    public var center: CGPoint {
        get { return CGPoint(x: self.midX, y: self.midY) }
    }
}
