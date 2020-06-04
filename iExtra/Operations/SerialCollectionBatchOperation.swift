//
//  SerialCollectionBatchOperation.swift
//  iExtra
//
//  Created by Daniel Saidi on 2019-01-26.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

/*
 
 This protocol implements `CollectionOperation` by peforming
 the operation serially.
 
 When implementing this protocol, you therefore just have to
 implement `BatchOperation`.
 
 */

import Foundation

public protocol SerialCollectionBatchOperation: CollectionOperation, BatchOperation {
    
    var batchSize: Int { get }
}

public extension SerialCollectionBatchOperation {
    
    func perform(onCollection collection: [OperationItemType], completion: @escaping CollectionCompletion) {
        let batches = collection.batched(withBatchSize: batchSize)
        perform(at: 0, in: batches, errors: [], completion: completion)
    }
}

private extension SerialCollectionBatchOperation {
    
    func perform(at index: Int, in batches: [[OperationItemType]], errors: [Error], completion: @escaping CollectionCompletion) {
        guard batches.count > index else { return completion(errors) }
        let batch = batches[index]
        perform(onBatch: batch) { error in
            let errors = errors + [error].compactMap { $0 }
            self.perform(at: index + 1, in: batches, errors: errors, completion: completion)
        }
    }
}

private extension Sequence {
  
    /**
     Batch the sequence into groups of a certain max size.
     */
    func batched(withBatchSize size: Int) -> [[Element]] {
        var result: [[Element]] = []
        var batch: [Element] = []
        
        forEach {
            batch.append($0)
            if batch.count == size {
                result.append(batch)
                batch = []
            }
        }
        
        if !batch.isEmpty {
            result.append(batch)
        }
        
        return result
    }
}
