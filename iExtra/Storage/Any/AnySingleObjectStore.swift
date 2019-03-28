//
//  AnySingleObjectStore.swift
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

public class AnySingleObjectStore<ObjectType>: SingleObjectStore {
    
    public init<T: SingleObjectStore>(_ store: T) where T.ObjectType == ObjectType {
        self.deleteContentClosure = store.deleteContent
        self.getObjectClosure = store.getObject
        self.storeObjectClosure = store.store
    }
    
    private let deleteContentClosure: () -> ()
    private let getObjectClosure: () -> (ObjectType?)
    private let storeObjectClosure: (ObjectType) -> ()
    
    public func deleteContent() {
        deleteContentClosure()
    }
    
    public func getObject() -> ObjectType? {
        return getObjectClosure()
    }
    
    public func store(_ object: ObjectType) {
        storeObjectClosure(object)
    }
}
