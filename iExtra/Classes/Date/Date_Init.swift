//
//  NSDate_Init.swift
//  iExtra
//
//  Created by Daniel Saidi on 2015-05-15.
//  Copyright (c) 2015 Daniel Saidi. All rights reserved.
//

import Foundation

public extension Date {
    
    public func addingDays(_ days: Int) -> Date {
        let seconds = Double(days) * 60 * 60 * 24
        return addingTimeInterval(seconds)
    }
    
    public func addingHours(_ hours: Int) -> Date {
        let seconds = Double(hours) * 60 * 60
        return addingTimeInterval(seconds)
    }
    
    public func addingMinutes(_ minutes: Int) -> Date {
        let seconds = Double(minutes) * 60
        return addingTimeInterval(seconds)
    }
    
    public func addingSeconds(_ seconds: Int) -> Date {
        return addingTimeInterval(Double(seconds))
    }
}
