//
//  SequentialBatchOperation.swift
//  iExtra
//
//  Created by Daniel Saidi on 2019-01-23.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

/*
 
 This protocol specializes the `BatchOperation` protocol. It
 will perform its operation sequentially on every item batch
 from the collection. This logic is already implemented as a
 protocol extension.
 
 When implementing this protocol, you therefore just have to
 implement `performOperation(onBatch:completion:)`.
 
 */

import Foundation

public protocol SequentialBatchOperation: BatchOperation {}

public extension SequentialBatchOperation {
    
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
