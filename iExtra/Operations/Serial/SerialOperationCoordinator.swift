//
//  SerialOperationCoordinator.swift
//  iExtra
//
//  Created by Daniel Saidi on 2019-01-29.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

/*
 
 This protocol specializes `OperationCoordinator` as well as
 `SerialItemOperation`.
 
 When you implement this protocol, you don't have to provide
 any implementations, since this protocol already implements
 everything by combining the protocols it implements with an
 extension that bridges the two protocols.
 
 This means that any class that implements this protocol has
 already implemented serial operation coordination. This can
 either be a public or internal implementation detail.
 
 If you implement it publicly, you don't have to add any new
 logic to your implementation, but you can if you want. When
 you implement it internally, however, you probably want the
 implementation to be responsible for generating or fetching
 the operations it should perform, as well as operate on the
 operations, probably with a completely different interface.
 
 
 */

import Foundation

public protocol SerialOperationCoordinator: OperationCoordinator, SerialItemOperation where CollectionType == Operation {}

public extension SerialOperationCoordinator {
    
    func performOperation(onItem item: iExtra.Operation, completion: @escaping ItemCompletion) {
        item.perform(completion: completion)
    }
    
    func performOperations(_ operations: [Operation], completion: @escaping Completion) {
        performOperation(on: operations, completion: completion)
    }
}
