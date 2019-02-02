//
//  ItemOperation.swift
//  iExtra
//
//  Created by Daniel Saidi on 2019-01-26.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

/*
 
 This protocol can be implemented by classes that perform an
 operation on individual items in a typed collection.
 
 When you implement this protocol, just implement everything
 that is required by `CollectionOperation` and implement the
 `performOperation(onItem:completion:)` function as well.
 
 It is important to call the item completion when every item
 is processes, since operations may rely on it completion to
 coordinate their executions.
 
 */

import Foundation

public protocol ItemOperation: CollectionOperation {
    
    typealias ItemCompletion = (Error?) -> ()
    
    func performOperation(onItem item: T, completion: @escaping ItemCompletion)
}
