//
//  ItemOperation.swift
//  iExtra
//
//  Created by Daniel Saidi on 2019-01-26.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

/*
 
 An item operation can be performed on individual items of a
 certain type.
 
 When implementing this protocol, specify `OperationItemType`
 by creating a typealias in your implementation.
 
 */

import Foundation

public protocol ItemOperation: OperationItemTypeProvider {
    
    typealias ItemCompletion = (Error?) -> ()
    
    func perform(onItem item: OperationItemType, completion: @escaping ItemCompletion)
}
