//
//  ConcurrentOperationCoordinator.swift
//  iExtra
//
//  Created by Daniel Saidi on 2019-01-26.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

/*
 
 This coordinator performs operations concurrently. It could
 be used either directly or as an internal tool in any other
 classes, e.g. data syncers, to hide the "operation" concept
 from their external apis.
 
 */

public class ConcurrentOperationCoordinator: OperationCoordinator, ConcurrentCollectionItemOperation {
    
    public init() {}
    
    public typealias OperationItemType = Operation
    
    public func perform(_ operations: [Operation], completion: @escaping CollectionCompletion) {
        perform(onCollection: operations, completion: completion)
    }
    
    public func perform(onItem item: Operation, completion: @escaping ItemCompletion) {
        item.perform(completion: completion)
    }
}
