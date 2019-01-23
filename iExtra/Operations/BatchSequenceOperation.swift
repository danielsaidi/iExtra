//
//  BatchSequenceOperation.swift
//  iExtra
//
//  Created by Daniel Saidi on 2019-01-23.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

/*
 
 This protocol can be implemented by classes that perform an
 operation on batched groups of object from a collection.
 
 When implementing this protocol, you just have to implement
 `performOperation(on:completion:)` and make sure to execute
 the completion once the operation completes. Then just call
 `startOperating(on:batchSize:completion)` on any collection
 of items, to sequentially process them in batches. You will
 receive a callback when the operation has been performed on
 evey batch.
 
 The protocol is designed for asynchronicity, like a network
 request, but can be used for synchronous operations as well.
 
 */

import Foundation

public protocol BatchSequenceOperation: AnyObject {
    
    associatedtype T
    typealias Completion = (Error?) -> ()
    typealias FinalCompletion = ([Error?]) -> ()
    
    func performOperation(on batch: [T], completion: @escaping Completion)
}

public extension BatchSequenceOperation {
    
    func startOperating(on objects: [T], batchSize: Int, completion: @escaping FinalCompletion) {
        let batches = objects.batched(withBatchSize: batchSize)
        performOperation(at: 0, in: batches, errors: [], completion: completion)
    }
}

private extension BatchSequenceOperation {
    
    func performOperation(at index: Int, in batches: [[T]], errors: [Error?], completion: @escaping FinalCompletion) {
        guard batches.count > index else { return completion(errors) }
        let batch = batches[index]
        performOperation(on: batch) { [weak self] error in
            let errors = errors + [error]
            self?.performOperation(at: index + 1, in: batches, errors: errors, completion: completion)
        }
    }
}
