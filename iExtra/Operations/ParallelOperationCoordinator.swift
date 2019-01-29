//
//  ParallelOperationCoordinator.swift
//  iExtra
//
//  Created by Daniel Saidi on 2019-01-29.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

/*
 
 This protocol specializes `OperationCoordinator` and has an
 auto-implemented `performOperations(:completion:) that will
 perform all operations in parallel.
 
 When you implement this protocol, you therefore do not have
 to implement any functionality at all except to either call
 `performOperations` with a set of operations or simply make
 your implementation provide its own operations and keep the
 `ParallelOperationCoordinator` implementation private.
 
 */

import Foundation

public protocol ParallelOperationCoordinator: OperationCoordinator {}

public extension ParallelOperationCoordinator {
    
    func performOperations(_ operations: [Operation], completion: @escaping Completion) {
        guard operations.count > 0 else { return completion([]) }
        var errors = [Error?]()
        operations.forEach {
            $0.perform { error in
                errors.append(error)
                let isComplete = errors.count == operations.count
                guard isComplete else { return }
                completion(errors)
            }
        }
    }
}
