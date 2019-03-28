//
//  ConcurrentCollectionBatchOperation.swift
//  iExtra
//
//  Created by Daniel Saidi on 2019-01-26.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

/*
 
 This protocol implements `CollectionOperation` by peforming
 the operation concurrently.
 
 When implementing this protocol, you therefore just have to
 implement `BatchOperation`.
 
 */

import Foundation

public protocol ConcurrentCollectionBatchOperation: CollectionOperation, BatchOperation {
    
    var batchSize: Int { get }
}

public extension ConcurrentCollectionBatchOperation {
    
    func perform(onCollection collection: [OperationItemType], completion: @escaping CollectionCompletion) {
        guard collection.count > 0 else { return completion([]) }
        var errors = [Error?]()
        let batches = collection.batched(withBatchSize: batchSize)
        batches.forEach {
            perform(onBatch: $0) { error in
                errors.append(error)
                let isComplete = errors.count == batches.count
                guard isComplete else { return }
                completion(errors.compactMap { $0 })
            }
        }
    }
}
