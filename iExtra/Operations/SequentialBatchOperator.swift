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
 function is already implemented as a protocol extension. Do
 rememeber to call the batch completion for every batch. The
 completion call makes the execution proceed.
 
 When the operation completely finishes, the completion will
 receive an error array, where every error is batch-specific.
 
 */

import Foundation

public protocol SequentialBatchOperator: CollectionOperator {
    
    typealias BatchCompletion = (Error?) -> ()
    
    var batchSize: Int { get }
    
    func performOperation(onBatch batch: [T], completion: @escaping BatchCompletion)
    
}

public extension SequentialBatchOperator {
    
    public func performOperation(on collection: [T], completion: @escaping Completion) {
        let batches = collection.batched(withBatchSize: batchSize)
        performOperation(at: 0, in: batches, errors: [], completion: completion)
    }
}

private extension SequentialBatchOperator {
    
    func performOperation(at index: Int, in batches: [[T]], errors: [Error?], completion: @escaping Completion) {
        guard batches.count > index else { return completion(errors) }
        let batch = batches[index]
        performOperation(onBatch: batch) { [weak self] error in
            let errors = errors + [error]
            self?.performOperation(at: index + 1, in: batches, errors: errors, completion: completion)
        }
    }
}
