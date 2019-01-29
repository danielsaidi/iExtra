//
//  OperationCoordinator.swift
//  iExtra
//
//  Created by Daniel Saidi on 2019-01-29.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

/*
 
 This protocol can be implemented by classes that coordinate
 several parameterless operations.
 
 */

import Foundation

public protocol OperationCoordinator {
    
    typealias Completion = ([Error?]) -> ()
    
    func performOperations(_ operations: [Operation], completion: @escaping Completion)
}
