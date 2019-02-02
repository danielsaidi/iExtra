//
//  BatchOperation.swift
//  iExtra
//
//  Created by Daniel Saidi on 2019-01-26.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

/*
 
 This protocol can be implemented by classes that perform an
 operation on batches of items from a typed collection.
 
 When you implement this protocol, just implement everything
 that is required by `CollectionOperation` and implement the
 `performOperation(onBatch:completion:)` function as well.
 
 It's important to call the batch completion when each batch
 is processes, since operations may rely on it completion to
 coordinate their executions.
 
 */

import Foundation

public protocol BatchOperation: CollectionOperation {
    
    typealias BatchCompletion = (Error?) -> ()
    
    var batchSize: Int { get }
    
    func performOperation(onBatch batch: [T], completion: @escaping BatchCompletion)
}
