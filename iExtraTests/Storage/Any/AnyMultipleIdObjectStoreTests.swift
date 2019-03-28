import Quick
import Nimble
import iExtra

class AnyMultipleIdObjectStoreTests: QuickSpec {
    
    override func spec() {
        
        var store: MockMultipleIdObjectStore<TestObject, Int>!
        var anyStore: AnyMultipleIdObjectStore<TestObject, Int>!
        
        beforeEach {
            store = MockMultipleIdObjectStore<TestObject, Int>()
            anyStore = AnyMultipleIdObjectStore(store)
        }
        
        describe("deleting object with id") {
            
            it("returns base service object") {
                store.deleteObject(withId: 123)
                expect(store.deleteObjectsWithIdsInvokeCount).to(equal(1))
                expect(store.deleteObjectsWithIdsInvokeIds.count).to(equal(1))
                expect(store.deleteObjectsWithIdsInvokeIds[0]).to(equal([123]))
            }
        }
        
        describe("getting object with id") {
            
            it("returns base service objects") {
                store.getObjectsWithIdsObjects = [TestObject(name: "foo")]
                let result = anyStore.getObject(withId: 123)
                expect(store.getObjectsWithIdsInvokeCount).to(equal(1))
                expect(store.getObjectsWithIdsInvokeIds.count).to(equal(1))
                expect(store.getObjectsWithIdsInvokeIds[0]).to(equal([123]))
                expect(result!.name).to(equal("foo"))
            }
        }
    }
}

private struct TestObject {
    
    let name: String
}
