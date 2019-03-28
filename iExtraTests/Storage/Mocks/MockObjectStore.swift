import iExtra

class MockObjectStore: ObjectStore {
    
    var deleteContentInvokeCount = 0
    public func deleteContent() {
        deleteContentInvokeCount += 1
    }
}
