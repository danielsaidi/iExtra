//
//  SerialBatchOperation.swift
//  iExtra
//
//  Created by Daniel Saidi on 2019-01-23.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

/*
 
 This protocol specializes the `BatchOperation` protocol. It
 performs its operation in serial on batches of items from a
 typed collection. This is already implemented as a protocol
 extension, so you just have to specify `CollectionType` and
 implement `perform(onBatch:completion:)`.
 
 */

import Foundation

public protocol SerialBatchOperation: BatchOperation {}

public extension SerialBatchOperation {
    
    func perform(on collection: [T], completion: @escaping Completion) {
        let batches = collection.batched(withBatchSize: batchSize)
        perform(at: 0, in: batches, errors: [], completion: completion)
    }
    
    private func perform(at index: Int, in batches: [[T]], errors: [Error?], completion: @escaping Completion) {
        guard batches.count > index else { return completion(errors) }
        let batch = batches[index]
        perform(onBatch: batch) { error in
            let errors = errors + [error]
            self.perform(at: index + 1, in: batches, errors: errors, completion: completion)
        }
    }
}
