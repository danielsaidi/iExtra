//
//  SerialOperationCoordinator.swift
//  iExtra
//
//  Created by Daniel Saidi on 2019-01-26.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

/*
 
 This coordinator performs a set of operations in serial. It
 can be used either directly or as an internal tool in other
 classes (e.g. data syncers) to hide the "operation" concept
 from their external apis.
 
 */

public class SerialOperationCoordinator: OperationCoordinator, SerialCollectionItemOperation {

    public init() {}

    public typealias OperationItemType = Operation

    public func perform(_ operations: [Operation], completion: @escaping CollectionCompletion) {
        perform(onCollection: operations, completion: completion)
    }

    public func perform(onItem item: Operation, completion: @escaping ItemCompletion) {
        item.perform(completion: completion)
    }
}
