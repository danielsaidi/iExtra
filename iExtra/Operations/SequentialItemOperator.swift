//
//  SequentialItemOperator.swift
//  iExtra
//
//  Created by Daniel Saidi on 2019-01-23.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

/*
 
 This protocol specializes the `CollectionOperator` protocol
 and can be implemented by classes that perform an operation
 in sequence on every item in a collection.
 
 When implementing this protocol, you just have to implement
 `performOperation(onItem:completion:)` since the collection
 function is already implemented as a protocol extension. It
 is very important to call the item completion every time an
 item operation completes, since every item completion makes
 the execution proceed.
 
 */

public protocol SequentialItemOperator: ItemOperator {}

public extension SequentialItemOperator {
    
    func performOperation(on collection: [T], completion: @escaping Completion) {
        performOperation(at: 0, in: collection, errors: [], completion: completion)
    }
    
    private func performOperation(at index: Int, in collection: [T], errors: [Error?], completion: @escaping Completion) {
        guard collection.count > index else { return completion(errors) }
        let object = collection[index]
        performOperation(onItem: object) { [weak self] error in
            let errors = errors + [error]
            self?.performOperation(at: index + 1, in: collection, errors: errors, completion: completion)
        }
    }
}
