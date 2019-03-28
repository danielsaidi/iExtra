import Quick
import Nimble
import iExtra

class AnyReferenceObjectStoreTests: QuickSpec {
    
    override func spec() {
        
        var store: MockReferenceObjectStore<TestObject, TestStoreObject>!
        var anyStore: AnyReferenceObjectStore<TestObject, TestStoreObject>!
        
        beforeEach {
            store = MockReferenceObjectStore<TestObject, TestStoreObject>()
            anyStore = AnyReferenceObjectStore(store)
        }
        
        describe("storing reference") {
            
            beforeEach {
                store.storeReferenceResult = TestObject(name: "Result")
            }
            
            it("calls base service") {
                let storeObject = TestStoreObject(name: "foo")
                _ = anyStore.storeReference(to: storeObject)
                expect(store.storeReferenceInvokeCount).to(equal(1))
                expect(store.storeReferenceInvokeObjects.count).to(equal(1))
                expect(store.storeReferenceInvokeObjects[0].name).to(equal("foo"))
            }
            
            it("returns reference") {
                let storeObject = TestStoreObject(name: "foo")
                let result = anyStore.storeReference(to: storeObject)
                expect(result.name).to(equal("Result"))
            }
        }
    }
}

private struct TestObject {
    
    let name: String
}

private struct TestStoreObject {
    
    let name: String
}
