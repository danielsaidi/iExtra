//
//  ParallelItemOperation.swift
//  iExtra
//
//  Created by Daniel Saidi on 2019-01-23.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

/*
 
 This protocol specializes the `ItemOperation` protocol, and
 will perform its operation in parallel on every item in the
 collection. This logic is already implemented as a protocol
 extension.
 
 When implementing this protocol, you therefore just have to
 implement `performOperation(onItem:completion:)`.
 
 */

import Foundation

public protocol ParallelItemOperation: ItemOperation {}

public extension ParallelItemOperation {
    
    func performOperation(on collection: [T], completion: @escaping Completion) {
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
