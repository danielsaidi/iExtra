//
//  DelayOperator.swift
//  iExtra
//
//  Created by Daniel Saidi on 2015-01-29.
//  Copyright © 2015 Daniel Saidi. All rights reserved.
//

import Foundation

public func delay(microseconds: Int, function: @escaping ()->()) {
    delay(interval: .microseconds(microseconds), function: function)
}

public func delay(milliseconds: Int, function: @escaping ()->()) {
    delay(interval: .milliseconds(milliseconds), function: function)
}

public func delay(nanoseconds: Int, function: @escaping ()->()) {
    delay(interval: .nanoseconds(nanoseconds), function: function)
}

public func delay(seconds: Int, function: @escaping ()->()) {
    delay(interval: .seconds(seconds), function: function)
}

public func delay(seconds: Double, function: @escaping ()->()) {
    let milliseconds = Int(seconds * 1000)
    delay(interval: .milliseconds(milliseconds), function: function)
}

public func delay(interval: DispatchTimeInterval, function: @escaping ()->()) {
    DispatchQueue.main.asyncAfter(deadline: .now() + interval, execute: function)
}
