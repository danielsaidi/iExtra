//
//  MultipleIdObjectStore.swift
//  iExtra
//
//  Created by Daniel Saidi on 2019-03-28.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

/*
 
 A multiple id object store is a multiple object store where
 objects can be accessed by id.
 
 */

import Foundation

public protocol MultipleIdObjectStore: MultipleObjectStore {
    
    associatedtype IdType
    
    func deleteObjects(withIds ids: [IdType])
    func getObjects(withIds ids: [IdType]) -> [ObjectType]
}

public extension MultipleIdObjectStore {
    
    func deleteObject(withId id: IdType) {
        deleteObjects(withIds: [id])
    }
    
    func getObject(withId id: IdType) -> ObjectType? {
        return getObjects(withIds: [id]).first
    }
    
    func hasObject(withId id: IdType) -> Bool {
        return getObject(withId: id) != nil
    }
}
