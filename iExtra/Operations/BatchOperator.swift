//
//  BatchOperator.swift
//  iExtra
//
//  Created by Daniel Saidi on 2019-01-26.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

/*
 
 This protocol should be implemented by classes that perform
 an operation on batches of items from a typed collection.
 
 When you implement this protocol, implement everything that
 is required by `CollectionOperator` then also implement the
 `performOperation(onBatch:completion:)` function. This will
 be called for every item batch. It's also very important to
 call the batch completion, since implementations rely on it.
 
 */

import Foundation

public protocol BatchOperator: CollectionOperator {
    
    typealias BatchCompletion = (Error?) -> ()
    
    var batchSize: Int { get }
    
    func performOperation(onBatch batch: [T], completion: @escaping BatchCompletion)
}
