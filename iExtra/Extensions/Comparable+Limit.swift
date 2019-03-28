//
//  Comparable+Limit.swift
//  iExtra
//
//  Created by Daniel Saidi on 2018-10-04.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

import Foundation

public extension Comparable {
    
    func limit(min: Self, max: Self) -> Self {
        if self < min { return min }
        if self > max { return max }
        return self
    }
}
