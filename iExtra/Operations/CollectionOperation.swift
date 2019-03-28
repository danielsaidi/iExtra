//
//  CollectionOperation.swift
//  iExtra
//
//  Created by Daniel Saidi on 2019-01-26.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

/*
 
 A collection operation can be performed on item collections
 of a certain type.
 
 When implementing this protocol, specify `OperationItemType`
 by creating a typealias in your implementation.
 
 */

import Foundation

public protocol CollectionOperation: OperationItemTypeProvider {
    
    typealias CollectionCompletion = ([Error]) -> ()
    
    func perform(onCollection collection: [OperationItemType], completion: @escaping CollectionCompletion)
}
