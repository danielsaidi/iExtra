//
//  Bool_Random.swift
//  iExtra
//
//  Created by Daniel Saidi on 2017-05-10.
//  Copyright (c) 2017 Daniel Saidi. All rights reserved.
//

import Foundation

public extension Bool {
    
    static func random() -> Bool {
        return Int.random(in: 0...1) == 1
    }
}
