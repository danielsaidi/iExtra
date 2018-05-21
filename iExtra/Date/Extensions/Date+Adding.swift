//
//  DateDate+Adding.swift
//  iExtra
//
//  Created by Daniel Saidi on 2015-05-15.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

//  TODO: Write unit tests

import Foundation

public extension Date {
    
    public func adding(days: Int) -> Date {
        let seconds = Double(days) * 60 * 60 * 24
        return addingTimeInterval(seconds)
    }
    
    public func adding(hours: Int) -> Date {
        let seconds = Double(hours) * 60 * 60
        return addingTimeInterval(seconds)
    }
    
    public func adding(minutes: Int) -> Date {
        let seconds = Double(minutes) * 60
        return addingTimeInterval(seconds)
    }
    
    public func adding(seconds: Int) -> Date {
        return addingTimeInterval(Double(seconds))
    }
}
