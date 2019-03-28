import iExtra

class MockReferenceObjectStore<ObjectType, StorageType>: MockMultipleObjectStore<ObjectType>, ReferenceObjectStore {
    
    var storeReferenceResult: ObjectType?
    var storeReferenceInvokeCount = 0
    var storeReferenceInvokeObjects = [StorageType]()
    func storeReference(to object: StorageType) -> ObjectType {
        storeReferenceInvokeCount += 1
        storeReferenceInvokeObjects.append(object)
        return storeReferenceResult!
    }
}
