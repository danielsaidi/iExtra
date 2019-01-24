//
//  ParallellOperator.swift
//  iExtra
//
//  Created by Daniel Saidi on 2019-01-23.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

/*
 
 This protocol specializes the `CollectionOperator` protocol
 and can be implemented by classes that perform an operation
 in parallell on every item in a collection.
 
 When implementing this protocol, you just have to implement
 `performOperation(onItem:completion:)` since the collection
 function is already implemented as a protocol extension. Do
 rememeber to call the item completion for every item, since
 all completion calls are required to complete the execution.
 
 When the operation completely finishes, the completion will
 receive an error array, where every error is item-specific.
 
 */

public protocol ParallellOperator: CollectionOperator {
    
    typealias ItemCompletion = (Error?) -> ()
    
    func performOperation(onItem item: T, completion: @escaping ItemCompletion)
}

public extension ParallellOperator {
    
    public func performOperation(on collection: [T], completion: @escaping Completion) {
        guard collection.count > 0 else { return completion([]) }
        var errors = [Error?]()
        collection.forEach {
            performOperation(onItem: $0) { error in
                errors.append(error)
                let isComplete = errors.count == collection.count
                guard isComplete else { return }
                completion(errors)
            }
        }
    }
}
