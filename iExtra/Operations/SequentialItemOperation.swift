//
//  SequentialItemOperation.swift
//  iExtra
//
//  Created by Daniel Saidi on 2019-01-23.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

/*
 
 This protocol specializes the `ItemOperation` protocol, and
 will perform its operation sequentially on each item in the
 collection. This logic is already implemented as a protocol
 extension.
 
 When implementing this protocol, you therefore just have to
 implement `performOperation(onItem:completion:)`.
 
 */

import Foundation

public protocol SequentialItemOperation: ItemOperation {}

public extension SequentialItemOperation {
    
    func performOperation(on collection: [T], completion: @escaping Completion) {
        performOperation(at: 0, in: collection, errors: [], completion: completion)
    }
    
    private func performOperation(at index: Int, in collection: [T], errors: [Error?], completion: @escaping Completion) {
        guard collection.count > index else { return completion(errors) }
        let object = collection[index]
        performOperation(onItem: object) { error in
            let errors = errors + [error]
            self.performOperation(at: index + 1, in: collection, errors: errors, completion: completion)
        }
    }
}
