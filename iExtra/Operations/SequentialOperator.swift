//
//  SequentialOperator.swift
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
 function is already implemented as a protocol extension. Do
 rememeber to call the item completion for every item, since
 the completion call makes the execution proceed.
 
 When the operation completely finishes, the completion will
 receive an error array, where every error is item-specific.
 
 */

public protocol SequentialOperator: CollectionOperator {
    
    typealias ItemCompletion = (Error?) -> ()
    
    func performOperation(onItem item: T, completion: @escaping ItemCompletion)
}

public extension SequentialOperator {
    
    public func performOperation(on collection: [T], completion: @escaping Completion) {
        performOperation(at: 0, in: collection, errors: [], completion: completion)
    }
}

private extension SequentialOperator {
    
    func performOperation(at index: Int, in collection: [T], errors: [Error?], completion: @escaping Completion) {
        guard collection.count > index else { return completion(errors) }
        let object = collection[index]
        performOperation(onItem: object) { [weak self] error in
            let errors = errors + [error]
            self?.performOperation(at: index + 1, in: collection, errors: errors, completion: completion)
        }
    }
}
