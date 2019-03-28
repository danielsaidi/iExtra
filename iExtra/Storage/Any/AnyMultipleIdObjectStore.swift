//
//  AnyMultipleIdObjectStore.swift
//  iExtra
//
//  Created by Daniel Saidi on 2019-03-28.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

/*
 
 This type erasured store may be used instead of the generic
 protocol, to avoid problems with its associated types.
 
 */

import Foundation

public class AnyMultipleIdObjectStore<ObjectType, IdType>: AnyMultipleObjectStore<ObjectType>, MultipleIdObjectStore {
    
    public override init<T: MultipleIdObjectStore>(_ store: T) where T.ObjectType == ObjectType, T.IdType == IdType {
        self.deleteObjectsWithIdsClosure = store.deleteObjects
        self.getObjectsWithIdsClosure = store.getObjects
        super.init(store)
    }
    
    private let deleteObjectsWithIdsClosure: ([IdType]) -> ()
    private let getObjectsWithIdsClosure: ([IdType]) -> ([ObjectType])
    
    public func deleteObjects(withIds ids: [IdType]) {
        deleteObjectsWithIdsClosure(ids)
    }
    
    public func getObjects(withIds ids: [IdType]) -> [ObjectType] {
        return getObjectsWithIdsClosure(ids)
    }
}
