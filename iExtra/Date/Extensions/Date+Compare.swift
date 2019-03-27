//
//  Date+Compare.swift
//  iExtra
//
//  Created by Daniel Saidi on 2015-05-15.
//  Copyright © 2015 Daniel Saidi. All rights reserved.
//

import Foundation

public extension Date {
    
    func isAfter(_ date: Date) -> Bool {
        return compare(date) == .orderedDescending
    }
    
    func isBefore(_ date: Date) -> Bool {
        return compare(date) == .orderedAscending
    }
    
    func isSameAs(_ date: Date) -> Bool {
        return compare(date) == .orderedSame
    }
}
