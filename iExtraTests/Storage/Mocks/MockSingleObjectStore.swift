import iExtra

class MockSingleObjectStore<ObjectType>: MockObjectStore, SingleObjectStore {
    
    var object: ObjectType?
    var getObjectInvokeCount = 0
    func getObject() -> ObjectType? {
        getObjectInvokeCount += 1
        return object
    }
    
    var storeObjectInvokeCount = 0
    var storeObjectInvokeObjects = [ObjectType]()
    func store(_ object: ObjectType) {
        storeObjectInvokeCount += 1
        storeObjectInvokeObjects.append(object)
    }
}
