//
//  Operation.swift
//  iExtra
//
//  Created by Daniel Saidi on 2019-01-26.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

/*
 
 This protocol can be implemented by any operation that does
 not require any parameters. It's basically just an abstract
 description of "any" kind of anonymous operation, which can
 be composed in various ways.
 
 */

import Foundation

public protocol Operation {
    
    typealias OperationCompletion = (Error?) -> ()
    
    func perform(completion: @escaping OperationCompletion)
}
