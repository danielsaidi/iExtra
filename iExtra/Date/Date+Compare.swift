//
//  Date+Compare.swift
//  iExtra
//
//  Created by Daniel Saidi on 2015-05-15.
//  Copyright © 2015 Daniel Saidi. All rights reserved.
//

import Foundation

public extension Date {
    
    public func isAfter(_ date: Date) -> Bool {
        return compare(date) == .orderedDescending
    }
    
    public func isBefore(_ date: Date) -> Bool {
        return compare(date) == .orderedAscending
    }
    
    public func isSameAs(_ date: Date) -> Bool {
        return compare(date) == .orderedSame
    }
}
