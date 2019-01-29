//
//  SequentialBatchOperationTests.swift
//  iExtraTests
//
//  Created by Daniel Saidi on 2019-01-23.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import iExtra

class SequentialBatchOperationTests: QuickSpec {
    
    override func spec() {
        
        var obj: TestClass!
        
        beforeEach {
            obj = TestClass()
        }
        
        describe("when performing operation") {
            
            it("handles empty sequence") {
                var counter = 0
                obj.batchSize = 0
                obj.performOperation(on: []) { _ in counter += 1 }
                expect(counter).to(equal(1))
            }
            
            it("performs operation in batches") {
                obj.batchSize = 2
                obj.performOperation(on: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]) { _ in }
                expect(obj.result).to(equal([[2, 3], [5, 6], [8, 9], [11, 12], [14, 15]]))
            }
            
            it("performs operation sequentially and is affected by halt") {
                obj.batchSize = 2
                obj.performCompletion = false
                obj.performOperation(on: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]) { _ in }
                expect(obj.result).to(equal([[2, 3]]))
            }
            
            it("ignores invalid batch size") {
                obj.batchSize = 0
                obj.performOperation(on: [1, 2, 3, 4, 5]) { _ in }
                expect(obj.result).to(equal([[2, 3, 4, 5, 6]]))
            }
            
            it("completes with resulting errors") {
                let error = NSError(domain: "foo", code: 1, userInfo: nil )
                obj.error = error
                obj.batchSize = 2
                var result = [Error?]()
                obj.performOperation(on: [1, 2, 3, 4, 5]) { errors in
                    result = errors
                }
                expect(result[0]).toEventually(be(error))
                expect(result[1]).toEventually(be(error))
                expect(result[2]).toEventually(beNil())
            }
        }
    }
}

private class TestClass: SequentialBatchOperation {
    
    typealias CollectionType = Int
    
    var error: Error?
    var batchSize = 2
    var performCompletion = true
    private(set) var result = [[Int]]()
    private var addon = 1
    
    func performOperation(onBatch batch: [Int], completion: @escaping BatchCompletion) {
        result.append(batch.map { $0 + addon })
        addon += 1
        guard performCompletion else { return }
        completion(batch.count == 2 ? error: nil)
    }
}
