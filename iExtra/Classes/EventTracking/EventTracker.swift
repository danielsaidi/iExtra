//
//  EventTracker.swift
//  iExtra
//
//  Created by Daniel Saidi on 2015-02-07.
//  Copyright (c) 2015 Daniel Saidi. All rights reserved.
//

import Foundation

public protocol EventTracker {
    
    func track(action: String, in category: String, label: String)
    func track(action: String, in category: String, label: String, value: Int)
    func track(screen: String)
}
