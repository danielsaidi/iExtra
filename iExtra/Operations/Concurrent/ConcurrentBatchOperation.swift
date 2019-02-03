//
//  ConcurrentBatchOperation.swift
//  iExtra
//
//  Created by Daniel Saidi on 2019-01-23.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

/*
 
 This protocol specializes the `BatchOperation` protocol. It
 performs an operation concurrently on batches of items from
 a typed collection. This logic is already implemented as an
 extension, so you just have to specify `CollectionType` and
 implement `perform(onBatch:completion:)`.
 
 */

import Foundation

public protocol ConcurrentBatchOperation: BatchOperation {}

public extension ConcurrentBatchOperation {
    
    func perform(on collection: [T], completion: @escaping Completion) {
        guard collection.count > 0 else { return completion([]) }
        var errors = [Error?]()
        let batches = collection.batched(withBatchSize: batchSize)
        batches.forEach {
            perform(onBatch: $0) { error in
                errors.append(error)
                let isComplete = errors.count == batches.count
                guard isComplete else { return }
                completion(errors)
            }
        }
    }
}
