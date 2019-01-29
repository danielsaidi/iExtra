//
//  ParallellBatchOperation.swift
//  iExtra
//
//  Created by Daniel Saidi on 2019-01-23.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

/*
 
 This protocol specializes the `BatchOperation` protocol. It
 will perform its operation in parallell on every item batch
 from the collection. This logic is already implemented as a
 protocol extension.
 
 When implementing this protocol, you therefore just have to
 implement `performOperation(onBatch:completion:)`.
 
 */

import Foundation

public protocol ParallellBatchOperation: BatchOperation {}

public extension ParallellBatchOperation {
    
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
