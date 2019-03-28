//
//  ReferenceObjectStore.swift
//  iExtra
//
//  Created by Daniel Saidi on 2019-03-28.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

/*
 
 A reference object store contains multiple objects that are
 accessed by reference. When you store objects, you must use
 objects of `StorageType`. You will then receive a reference
 to the stored object, which is of `ObjectType`. You can use
 this reference to delete the stored object.
 
 */

import UIKit

public protocol ReferenceObjectStore: MultipleObjectStore {
    
    associatedtype StorageType
    
    func storeReference(to object: StorageType) -> ObjectType
}
