//
//  SerialCollectionItemOperation.swift
//  iExtra
//
//  Created by Daniel Saidi on 2019-01-26.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

/*
 
 This protocol implements `CollectionOperation` by peforming
 the operation serially.
 
 When implementing this protocol, you therefore just have to
 implement `ItemOperation`.
 
 */

import Foundation

public protocol SerialCollectionItemOperation: CollectionOperation, ItemOperation {}

public extension SerialCollectionItemOperation {
    
    func perform(onCollection collection: [OperationItemType], completion: @escaping CollectionCompletion) {
        perform(at: 0, in: collection, errors: [], completion: completion)
    }
}

private extension SerialCollectionItemOperation {
    
    func perform(at index: Int, in collection: [OperationItemType], errors: [Error], completion: @escaping CollectionCompletion) {
        guard collection.count > index else { return completion(errors) }
        let object = collection[index]
        perform(onItem: object) { error in
            let errors = errors + [error].compactMap { $0 }
            self.perform(at: index + 1, in: collection, errors: errors, completion: completion)
        }
    }
}
