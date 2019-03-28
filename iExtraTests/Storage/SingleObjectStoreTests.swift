import Quick
import Nimble
import iExtra

class SingleObjectStoreTests: QuickSpec {
    
    override func spec() {
        
        var store: MockSingleObjectStore<TestObject>!
        
        beforeEach {
            store = MockSingleObjectStore<TestObject>()
        }
        
        describe("has object") {
            
            it("is false if store has no object") {
                store.object = nil
                expect(store.hasObject).to(beFalse())
            }
            
            it("is true if store has object") {
                store.object = TestObject(name: "foo")
                expect(store.hasObject).to(beTrue())
            }
        }
        
        describe("delete object") {
            
            it("deletes all content") {
                store.deleteObject()
                expect(store.deleteContentInvokeCount).to(equal(1))
            }
        }
    }
}

private struct TestObject {
    
    var name: String
}
