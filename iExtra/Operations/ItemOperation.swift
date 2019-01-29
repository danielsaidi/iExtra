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
 
 When you implement this protocol, implement everything that
 is required by `CollectionOperation` and also implement the
 `performOperation(onItem:completion:)` function, which will
 be called for every item. It is also very important to call
 the item completion, since item operations may rely on this
 completion coordinate their execution.
 
 */

import Foundation

public protocol ItemOperation: CollectionOperation {
    
    typealias ItemCompletion = (Error?) -> ()
    
    func performOperation(onItem item: T, completion: @escaping ItemCompletion)
}
