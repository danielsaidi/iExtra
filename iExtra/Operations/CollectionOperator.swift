//
//  CollectionOperator.swift
//  iExtra
//
//  Created by Daniel Saidi on 2019-01-23.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

/*
 
 This protocol can be implemented by classes that perform an
 operation on a collection.
 
 When implementing this protocol, you just have to implement
 `performOperation(on:completion:)` and make sure to execute
 the completion once the operation is completely finished.
 
 */

import Foundation

public protocol CollectionOperator: AnyObject {
    
    associatedtype CollectionType
    typealias T = CollectionType
    typealias Completion = ([Error?]) -> ()
    
    func performOperation(on collection: [T], completion: @escaping Completion)
}
