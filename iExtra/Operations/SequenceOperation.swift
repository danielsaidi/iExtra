//
//  SequenceOperation.swift
//  iExtra
//
//  Created by Daniel Saidi on 2019-01-23.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

/*
 
 This protocol can be implemented by classes that perform an
 operation on every object in a collection.
 
 When implementing this protocol, you just have to implement
 `performOperation(on:completion:)` and make sure to execute
 the completion once the operation completes. Then just call
 `startOperating(on:completion:)` on any collection of items
 to process them sequentially. You will receive a completion
 callback when the operation has been performed on evey item
 in the collection.
 
 The protocol is designed for asynchronicity, like a network
 request, but can be used for synchronous operations as well.
 
 */

import Foundation

public protocol SequenceOperation: AnyObject {
    
    associatedtype T
    typealias Completion = (Error?) -> ()
    typealias FinalCompletion = ([Error?]) -> ()
    
    func performOperation(on object: T, completion: @escaping Completion)
}

public extension SequenceOperation {
    
    func startOperating(on objects: [T], completion: @escaping FinalCompletion) {
        performOperation(at: 0, in: objects, errors: [], completion: completion)
    }
}

private extension SequenceOperation {
    
    func performOperation(at index: Int, in objects: [T], errors: [Error?], completion: @escaping FinalCompletion) {
        guard objects.count > index else { return completion(errors) }
        let object = objects[index]
        performOperation(on: object) { [weak self] error in
            let errors = errors + [error]
            self?.performOperation(at: index + 1, in: objects, errors: errors, completion: completion)
        }
    }
}
