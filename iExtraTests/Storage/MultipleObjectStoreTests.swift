import Quick
import Nimble
import iExtra

class MultipleObjectStoreTests: QuickSpec {
    
    override func spec() {
        
        var store: MockMultipleObjectStore<TestObject>!
        
        beforeEach {
            store = MockMultipleObjectStore<TestObject>()
        }
        
        describe("has objects") {
            
            it("is false if store has no objects") {
                store.allObjects = []
                expect(store.hasObjects).to(beFalse())
            }
            
            it("is true if store has objects") {
                store.allObjects = [TestObject(name: "foo")]
                expect(store.hasObjects).to(beTrue())
            }
        }
        
        describe("deleting single object") {
            
            it("calls delete multiple objects with single object array") {
                store.delete(TestObject(name: "delete"))
                expect(store.deleteObjectsInvokeCount).to(equal(1))
                expect(store.deleteObjectsInvokeObjects.count).to(equal(1))
                expect(store.deleteObjectsInvokeObjects[0].count).to(equal(1))
                expect(store.deleteObjectsInvokeObjects[0][0].name).to(equal("delete"))
            }
        }
        
        describe("deleting all objects") {
            
            it("deletes all content") {
                store.deleteAllObjects()
                expect(store.deleteContentInvokeCount).to(equal(1))
            }
        }
        
        describe("storing single object") {
            
            it("calls store multiple objects with single object array") {
                store.store(TestObject(name: "store"))
                expect(store.storeObjectsInvokeCount).to(equal(1))
                expect(store.storeObjectsInvokeObjects.count).to(equal(1))
                expect(store.storeObjectsInvokeObjects[0].count).to(equal(1))
                expect(store.storeObjectsInvokeObjects[0][0].name).to(equal("store"))
            }
        }
    }
}

private struct TestObject {
    
    var name: String
}
