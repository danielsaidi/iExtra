import Quick
import Nimble
import iExtra

class AnyMultipleObjectStoreTests: QuickSpec {
    
    override func spec() {
        
        var store: MockMultipleObjectStore<TestObject>!
        var anyStore: AnyMultipleObjectStore<TestObject>!
        
        beforeEach {
            store = MockMultipleObjectStore<TestObject>()
            anyStore = AnyMultipleObjectStore(store)
        }
        
        describe("deleting content") {
            
            it("calls base service") {
                anyStore.deleteContent()
                expect(store.deleteContentInvokeCount).to(equal(1))
            }
        }
        
        describe("deleting objects") {
            
            it("returns base service object") {
                let objects = [TestObject(name: "foo"), TestObject(name: "bar")]
                store.delete(objects)
                expect(store.deleteObjectsInvokeCount).to(equal(1))
                expect(store.deleteObjectsInvokeObjects.count).to(equal(1))
                expect(store.deleteObjectsInvokeObjects[0].count).to(equal(2))
                expect(store.deleteObjectsInvokeObjects[0][0].name).to(equal("foo"))
                expect(store.deleteObjectsInvokeObjects[0][1].name).to(equal("bar"))
            }
        }
        
        describe("getting all objects") {
            
            it("returns base service objects") {
                store.allObjects = [TestObject(name: "foo"), TestObject(name: "bar")]
                let result = anyStore.getAllObjects()
                expect(store.getAllObjectsInvokeCount).to(equal(1))
                expect(result.count).to(equal(2))
                expect(result[0].name).to(equal("foo"))
                expect(result[1].name).to(equal("bar"))
            }
        }
        
        describe("storing objects") {
            
            it("calls base service") {
                let objects = [TestObject(name: "foo"), TestObject(name: "bar")]
                anyStore.store(objects)
                expect(store.storeObjectsInvokeCount).to(equal(1))
                expect(store.storeObjectsInvokeObjects.count).to(equal(1))
                expect(store.storeObjectsInvokeObjects[0].count).to(equal(2))
                expect(store.storeObjectsInvokeObjects[0][0].name).to(equal("foo"))
                expect(store.storeObjectsInvokeObjects[0][1].name).to(equal("bar"))
            }
        }
    }
}

private struct TestObject {
    
    let name: String
}
