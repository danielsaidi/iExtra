//
//  ParallelOperationCoordinator.swift
//  iExtra
//
//  Created by Daniel Saidi on 2019-01-29.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

/*
 
 This protocol specializes `OperationCoordinator` as well as
 `ParallelItemOperation` and therefore provides a complete
 implementation to perform multiple operations sequentially.
 
 When you implement this protocol, you therefore do not have
 to implement any functionality at all. If you implement the
 protocol publicly, you just have to call `performOperations`.
 If you implement it privately, you can have any class logic
 make use of the functionality it provides.
 
 */

import Foundation

public protocol ParallelOperationCoordinator: OperationCoordinator, ParallelItemOperation where CollectionType == Operation {}

public extension ParallelOperationCoordinator {
    
    func performOperation(onItem item: iExtra.Operation, completion: @escaping ItemCompletion) {
        item.perform(completion: completion)
    }
    
    func performOperations(_ operations: [Operation], completion: @escaping Completion) {
        performOperation(on: operations, completion: completion)
    }
}
