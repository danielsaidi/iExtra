//
//  ParallellBatchOperator.swift
//  iExtra
//
//  Created by Daniel Saidi on 2019-01-23.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

/*
 
 This protocol specializes the `CollectionOperator` protocol
 and can be implemented by classes that perform an operation
 in sequence on batches of items in a collection.
 
 When implementing this protocol, you just have to implement
 `performOperation(onBatch:completion)` since the collection
 function is already implemented as a protocol extension. It
 is very important to call the batch completion every time a
 batch operation completes, since all completions are needed
 to complete the execution.
 
 */

import Foundation

public protocol ParallellBatchOperator: BatchOperator {}

public extension ParallellBatchOperator {
    
    func performOperation(on collection: [T], completion: @escaping Completion) {
        guard collection.count > 0 else { return completion([]) }
        var errors = [Error?]()
        let batches = collection.batched(withBatchSize: batchSize)
        batches.forEach {
            performOperation(onBatch: $0) { error in
                errors.append(error)
                let isComplete = errors.count == batches.count
                guard isComplete else { return }
                completion(errors)
            }
        }
    }
}
