//
//  Operation.swift
//  iExtra
//
//  Created by Daniel Saidi on 2019-01-29.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

/*
 
 This protocol can be implemented by classes that perform an
 operation in any kind of way. It's the most basic operation
 and basically just an abstract description that can be used
 to coordinate many parameterless operations.
 
 */

import Foundation

public protocol Operation {
    
    typealias Completion = (Error?) -> ()
    
    func perform(completion: @escaping Completion)
}
