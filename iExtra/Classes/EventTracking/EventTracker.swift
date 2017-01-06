//
//  EventTracker.swift
//  iExtra
//
//  Created by Daniel Saidi on 2015-02-07.
//  Copyright (c) 2015 Daniel Saidi. All rights reserved.
//

import Foundation

protocol EventTracker {
    func trackAction(_ name: String, inCategory category: String, label: String)
    func trackAction(_ name: String, inCategory category: String, label: String, value: Int)
    func trackScreen(_ name: String)
}
