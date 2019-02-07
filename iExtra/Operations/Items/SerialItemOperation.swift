//
//  SerialItemOperation.swift
//  iExtra
//
//  Created by Daniel Saidi on 2019-01-23.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

/*
 
 This protocol specializes the `ItemOperation` protocol, and
 performs its operation in serial on individual items from a
 typed collection. This is already implemented as a protocol
 extension, so you just have to specify `CollectionType` and
 implement `perform(onItem:completion:)`.
 
 */

import Foundation

public protocol SerialItemOperation: ItemOperation {}

public extension SerialItemOperation {
    
    func perform(on collection: [T], completion: @escaping Completion) {
        perform(at: 0, in: collection, errors: [], completion: completion)
    }
    
    private func perform(at index: Int, in collection: [T], errors: [Error?], completion: @escaping Completion) {
        guard collection.count > index else { return completion(errors) }
        let object = collection[index]
        perform(onItem: object) { error in
            let errors = errors + [error]
            self.perform(at: index + 1, in: collection, errors: errors, completion: completion)
        }
    }
}
