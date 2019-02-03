//
//  SerialOperationCoordinator.swift
//  iExtra
//
//  Created by Daniel Saidi on 2019-01-29.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

/*
 
 This class implements `OperationCoordinator` as well as the
 `SerialItemOperation` protocol.
 
 This coordinator performs a set of operations in serial. It
 can be used either directly or as an internal tool in other
 classes, e.g. data syncers, to hide the "operation" concept
 from their external apis.
 
 */

import Foundation

public class SerialOperationCoordinator: OperationCoordinator, SerialItemOperation {
    
    public typealias CollectionType = Operation
    
    public func perform(operations: [Operation], completion: @escaping Completion) {
        perform(on: operations, completion: completion)
    }
    
    public func perform(onItem item: iExtra.Operation, completion: @escaping ItemCompletion) {
        item.perform(completion: completion)
    }
}
