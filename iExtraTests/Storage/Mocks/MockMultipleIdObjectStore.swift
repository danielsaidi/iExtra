import iExtra

class MockMultipleIdObjectStore<ObjectType, IdType>: MockMultipleObjectStore<ObjectType>, MultipleIdObjectStore {
    
    var deleteObjectsWithIdsInvokeCount = 0
    var deleteObjectsWithIdsInvokeIds = [[IdType]]()
    func deleteObjects(withIds ids: [IdType]) {
        deleteObjectsWithIdsInvokeCount += 1
        deleteObjectsWithIdsInvokeIds.append(ids)
    }
    
    var getObjectsWithIdsObjects = [ObjectType]()
    var getObjectsWithIdsInvokeCount = 0
    var getObjectsWithIdsInvokeIds = [[IdType]]()
    func getObjects(withIds ids: [IdType]) -> [ObjectType] {
        getObjectsWithIdsInvokeCount += 1
        getObjectsWithIdsInvokeIds.append(ids)
        return getObjectsWithIdsObjects
    }
}
