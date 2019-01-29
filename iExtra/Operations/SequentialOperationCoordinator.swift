//
//  SequentialOperationCoordinator.swift
//  iExtra
//
//  Created by Daniel Saidi on 2019-01-29.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

/*
 
 This protocol specializes `OperationCoordinator` and has an
 auto-implemented `performOperations(:completion:) that will
 perform all operations sequentially.
 
 When you implement this protocol, you therefore do not have
 to implement any functionality at all except to either call
 `performOperations` with a set of operations or simply make
 your implementation provide its own operations and keep the
 `ParallelOperationCoordinator` implementation private.
 
 */

import Foundation

public protocol SequentialOperationCoordinator: OperationCoordinator {}

public extension SequentialOperationCoordinator {
    
    func performOperations(_ operations: [Operation], completion: @escaping Completion) {
        performOperation(at: 0, in: operations, errors: [], completion: completion)
    }
    
    private func performOperation(at index: Int, in operations: [Operation], errors: [Error?], completion: @escaping Completion) {
        guard operations.count > index else { return completion(errors) }
        let operation = operations[index]
        operation.perform { (error) in
            let errors = errors + [error]
            self.performOperation(at: index + 1, in: operations, errors: errors, completion: completion)
        }
    }
}
