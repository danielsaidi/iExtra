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
 function is already implemented as a protocol extension. Do
 rememeber to call the batch completion for every batch. The
 completion call makes the execution proceed.
 
 When the operation completely finishes, the completion will
 receive an error array, where every error is batch-specific.
 
 */

import Foundation

public protocol ParallellBatchOperator: CollectionOperator {
    
    typealias BatchCompletion = (Error?) -> ()
    
    var batchSize: Int { get }
    
    func performOperation(onBatch batch: [T], completion: @escaping BatchCompletion)
    
}

public extension ParallellBatchOperator {
    
    public func performOperation(on collection: [T], completion: @escaping Completion) {
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
