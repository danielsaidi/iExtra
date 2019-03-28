import Quick
import Nimble
import iExtra

class AnySingleObjectStoreTests: QuickSpec {
    
    override func spec() {
        
        var store: MockSingleObjectStore<TestObject>!
        var anyStore: AnySingleObjectStore<TestObject>!
        
        beforeEach {
            store = MockSingleObjectStore<TestObject>()
            anyStore = AnySingleObjectStore(store)
        }
        
        describe("deleting content") {
            
            it("calls base service") {
                anyStore.deleteContent()
                expect(store.deleteContentInvokeCount).to(equal(1))
            }
        }
        
        describe("getting object") {
            
            it("returns base service object") {
                store.object = TestObject(name: "foo")
                let result = anyStore.getObject()
                expect(store.getObjectInvokeCount).to(equal(1))
                expect(result!.name).to(equal("foo"))
            }
        }
        
        describe("storing object") {
            
            it("calls base service") {
                anyStore.store(TestObject(name: "bar"))
                expect(store.storeObjectInvokeCount).to(equal(1))
                expect(store.storeObjectInvokeObjects.count).to(equal(1))
                expect(store.storeObjectInvokeObjects[0].name).to(equal("bar"))
            }
        }
    }
}

private struct TestObject {
    
    let name: String
}
