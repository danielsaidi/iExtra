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
 
 When you implement this protocol, implement everything that
 is required by `CollectionOperation` and also implement the
 `performOperation(onBatch:completion:)` function. This will
 be called for every item batch. It's also important to call
 the batch completion when each batch completes, since batch
 operations may rely on it to coordinate their execution.
 
 */

import Foundation

public protocol BatchOperation: CollectionOperation {
    
    typealias BatchCompletion = (Error?) -> ()
    
    var batchSize: Int { get }
    
    func performOperation(onBatch batch: [T], completion: @escaping BatchCompletion)
}
