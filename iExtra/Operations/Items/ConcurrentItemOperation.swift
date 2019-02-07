//
//  ConcurrentItemOperation.swift
//  iExtra
//
//  Created by Daniel Saidi on 2019-01-23.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

/*
 
 This protocol specializes the `ItemOperation` protocol, and
 performs an operation concurrently on batches of items from
 a typed collection. This logic is already implemented as an
 extension, so you just have to specify `CollectionType` and
 implement `perform(onItem:completion:)`.
 
 */

import Foundation

public protocol ConcurrentItemOperation: ItemOperation {}

public extension ConcurrentItemOperation {
    
    func perform(on collection: [T], completion: @escaping Completion) {
        guard collection.count > 0 else { return completion([]) }
        var errors = [Error?]()
        collection.forEach {
            perform(onItem: $0) { error in
                errors.append(error)
                let isComplete = errors.count == collection.count
                guard isComplete else { return }
                completion(errors)
            }
        }
    }
}
