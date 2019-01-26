//
//  SequentialBatchOperator.swift
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
 batch operation completes, since every completion makes the
 execution proceed.
 
 */

import Foundation

public protocol SequentialBatchOperator: BatchOperator {}

public extension SequentialBatchOperator {
    
    func performOperation(on collection: [T], completion: @escaping Completion) {
        let batches = collection.batched(withBatchSize: batchSize)
        performOperation(at: 0, in: batches, errors: [], completion: completion)
    }
    
    private func performOperation(at index: Int, in batches: [[T]], errors: [Error?], completion: @escaping Completion) {
        guard batches.count > index else { return completion(errors) }
        let batch = batches[index]
        performOperation(onBatch: batch) { [weak self] error in
            let errors = errors + [error]
            self?.performOperation(at: index + 1, in: batches, errors: errors, completion: completion)
        }
    }
}
