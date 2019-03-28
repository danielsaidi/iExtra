//
//  MultipleObjectStore.swift
//  iExtra
//
//  Created by Daniel Saidi on 2019-03-28.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

/*
 
 A multiple object store contains multiple objects, that are
 of any type. If you want to be able to access objects by an
 id as well, use the MultipleIdObjectStore protocol instead.
 
 When implementing this protocol, you should just implement:
 
 * deleteContent()
 * delete(_ objects:)
 * getAllObjects()
 * store(_ objects:)
 
 and specify ObjectType. All other functionality is provided
 by the protocol extensions.
 
 */

import Foundation

public protocol MultipleObjectStore: ObjectStore {
    
    associatedtype ObjectType
    
    func delete(_ objects: [ObjectType])
    func getAllObjects() -> [ObjectType]
    func store(_ objects: [ObjectType])
}

public extension MultipleObjectStore {
    
    var hasObjects: Bool {
        return getAllObjects().count > 0
    }
    
    func delete(_ object: ObjectType) {
        delete([object])
    }
    
    func deleteAllObjects() {
        deleteContent()
    }
    
    func store(_ object: ObjectType) {
        store([object])
    }
}
