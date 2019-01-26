//
//  CollectionOperator.swift
//  iExtra
//
//  Created by Daniel Saidi on 2019-01-23.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

/*
 
 This protocol should be implemented by classes that perform
 an operation on a typed collection. When you implement this
 protocol, just implement `performOperation(on:completion:)`
 and specify a typealias for `CollectionType`.
 
 */

import Foundation

public protocol CollectionOperator: AnyObject {
    
    associatedtype CollectionType
    typealias T = CollectionType
    typealias Completion = ([Error?]) -> ()
    
    func performOperation(on collection: [T], completion: @escaping Completion)
}
