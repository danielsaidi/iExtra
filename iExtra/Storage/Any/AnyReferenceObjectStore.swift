//
//  AnyReferenceObjectStore.swift
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

public class AnyReferenceObjectStore<ObjectType, StorageType>: AnyMultipleObjectStore<ObjectType>, ReferenceObjectStore {
    
    public override init<T: ReferenceObjectStore>(_ store: T) where T.ObjectType == ObjectType, T.StorageType == StorageType {
        self.storeReferenceClosure = store.storeReference
        super.init(store)
    }
    
    private let storeReferenceClosure: (StorageType) -> (ObjectType)
    
    public func storeReference(to object: StorageType) -> ObjectType {
        return storeReferenceClosure(object)
    }
}
