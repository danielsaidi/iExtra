//
//  AnyMultipleObjectStore.swift
//  iExtra
//
//  Created by Daniel Saidi on 2019-03-28.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

/*
 
 This type erasured store may be used instead of the generic
 protocol, to avoid problems with its associated type.
 
 */

import Foundation

public class AnyMultipleObjectStore<ObjectType>: MultipleObjectStore {
    
    public init<T: MultipleObjectStore>(_ store: T) where T.ObjectType == ObjectType {
        self.deleteContentClosure = store.deleteContent
        self.deleteObjectsClosure = store.delete
        self.getAllObjectsClosure = store.getAllObjects
        self.storeObjectsClosure = store.store
    }
    
    private let deleteContentClosure: () -> ()
    private let deleteObjectsClosure: ([ObjectType]) -> ()
    private let getAllObjectsClosure: () -> ([ObjectType])
    private let storeObjectsClosure: ([ObjectType]) -> ()
    
    public func deleteContent() {
        deleteContentClosure()
    }
    
    public func delete(_ objects: [ObjectType]) {
        deleteObjectsClosure(objects)
    }
    
    public func getAllObjects() -> [ObjectType] {
        return getAllObjectsClosure()
    }
    
    public func store(_ objects: [ObjectType]) {
        storeObjectsClosure(objects)
    }
}
