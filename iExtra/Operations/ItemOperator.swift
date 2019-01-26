//
//  ItemOperator.swift
//  iExtra
//
//  Created by Daniel Saidi on 2019-01-26.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

/*
 
 This protocol should be implemented by classes that perform
 an operation on individual items in a typed collection.
 
 When you implement this protocol, implement everything that
 is required by `CollectionOperator` then also implement the
 `performOperation(onItem:completion:)` function, which will
 be called for every item in the collection. It is also very
 important to call the item completion since implememtations
 rely on it.
 
 */

import Foundation

public protocol ItemOperator: CollectionOperator {
    
    typealias ItemCompletion = (Error?) -> ()
    
    func performOperation(onItem item: T, completion: @escaping ItemCompletion)
}
