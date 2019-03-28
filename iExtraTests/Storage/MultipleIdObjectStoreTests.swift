import Quick
import Nimble
import iExtra

class MultipleIdObjectStoreTests: QuickSpec {
    
    override func spec() {
        
        var store: MockMultipleIdObjectStore<TestObject, TestObject.Id>!
        
        beforeEach {
            store = MockMultipleIdObjectStore<TestObject, TestObject.Id>()
        }
        
        describe("delete object with id") {
            
            it("calls delete objects with single id") {
                store.deleteObject(withId: 123)
                expect(store.deleteObjectsWithIdsInvokeCount).to(equal(1))
                expect(store.deleteObjectsWithIdsInvokeIds.count).to(equal(1))
                expect(store.deleteObjectsWithIdsInvokeIds[0].count).to(equal(1))
                expect(store.deleteObjectsWithIdsInvokeIds[0][0]).to(equal(123))
            }
        }
        
        describe("has object with id") {
            
            it("is false if store has no object") {
                store.getObjectsWithIdsObjects = []
                expect(store.hasObject(withId: 1)).to(beFalse())
            }
            
            it("is true if store has object") {
                store.getObjectsWithIdsObjects = [TestObject(id: 1, name: "foo")]
                expect(store.hasObject(withId: 1)).to(beTrue())
            }
        }
        
        describe("get object with id") {
            
            it("calls get objects with single id") {
                _ = store.getObject(withId: 123)
                expect(store.getObjectsWithIdsInvokeCount).to(equal(1))
                expect(store.getObjectsWithIdsInvokeIds.count).to(equal(1))
                expect(store.getObjectsWithIdsInvokeIds[0].count).to(equal(1))
                expect(store.getObjectsWithIdsInvokeIds[0][0]).to(equal(123))
            }
            
            it("returns first object if objects were returned") {
                store.getObjectsWithIdsObjects = [TestObject(id: 123, name: "foo")]
                let result = store.getObject(withId: 123)!
                expect(result.id).to(equal(123))
            }
            
            it("returns nil if no objects were returned") {
                let result = store.getObject(withId: 123)
                expect(result).to(beNil())
            }
        }
    }
}

private struct TestObject {
    
    typealias Id = Int
    
    let id: Id
    let name: String
}
