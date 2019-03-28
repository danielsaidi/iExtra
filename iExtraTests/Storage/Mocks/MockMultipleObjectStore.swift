import iExtra

class MockMultipleObjectStore<ObjectType>: MockObjectStore, MultipleObjectStore {
    
    var deleteObjectsInvokeCount = 0
    var deleteObjectsInvokeObjects = [[ObjectType]]()
    func delete(_ objects: [ObjectType]) {
        deleteObjectsInvokeCount += 1
        deleteObjectsInvokeObjects.append(objects)
    }
    
    var allObjects = [ObjectType]()
    var getAllObjectsInvokeCount = 0
    func getAllObjects() -> [ObjectType] {
        getAllObjectsInvokeCount += 1
        return allObjects
    }
    
    var storeObjectsInvokeCount = 0
    var storeObjectsInvokeObjects = [[ObjectType]]()
    func store(_ objects: [ObjectType]) {
        storeObjectsInvokeCount += 1
        storeObjectsInvokeObjects.append(objects)
    }
}
