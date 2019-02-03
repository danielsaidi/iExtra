//
//  CollectionOperation.swift
//  iExtra
//
//  Created by Daniel Saidi on 2019-01-23.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

/*
 
 This protocol can be implemented by classes that perform an
 operation on a typed collection.
 
 When implementing this protocol, you just have to implement
 `perform(on:completion:)` and define `CollectionType`.
 
 */

import Foundation

public protocol CollectionOperation: AnyObject {
    
    associatedtype CollectionType
    typealias T = CollectionType
    typealias Completion = ([Error?]) -> ()
    
    func perform(on collection: [T], completion: @escaping Completion)
}
