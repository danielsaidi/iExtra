//
//  ConcurrentCollectionItemOperation.swift
//  iExtra
//
//  Created by Daniel Saidi on 2019-01-26.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

/*
 
 This protocol implements `CollectionOperation` by peforming
 the operation concurrently.
 
 When implementing this protocol, you therefore just have to
 implement `ItemOperation`.
 
 */

import Foundation

public protocol ConcurrentCollectionItemOperation: CollectionOperation, ItemOperation {}

public extension ConcurrentCollectionItemOperation {
    
    func perform(onCollection collection: [OperationItemType], completion: @escaping CollectionCompletion) {
        guard collection.count > 0 else { return completion([]) }
        var errors = [Error?]()
        collection.forEach {
            perform(onItem: $0) { error in
                errors.append(error)
                let isComplete = errors.count == collection.count
                guard isComplete else { return }
                completion(errors.compactMap { $0 })
            }
        }
    }
}
