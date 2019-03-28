//
//  SingleObjectStore.swift
//  iExtra
//
//  Created by Daniel Saidi on 2019-03-28.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

/*
 
 A single object store contains a single object.
 
 While many of our stores may appear to be multi item stores,
 most are actually single object stores of array type.
 
 For instance, `SavedBooksStore` is a single object store in
 which we store a `[Book.Id]` array. It's not a multi object
 store of `Book` or `Book.Id` type.
 
 When implementing this protocol, you should just implement:
 
 * deleteContent()
 * getObject()
 * store(_ object:)
 
 and specify ObjectType. All other functionality is provided
 by the protocol extensions.
 
 */

import Foundation

public protocol SingleObjectStore: ObjectStore {
    
    associatedtype ObjectType
    
    func getObject() -> ObjectType?
    func store(_ object: ObjectType)
}

public extension SingleObjectStore {
    
    func deleteObject() {
        deleteContent()
    }
    
    var hasObject: Bool {
        return getObject() != nil
    }
}
