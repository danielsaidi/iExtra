//
//  ConcurrentCollectionBatchOperationTests.swift
//  iExtra
//
//  Created by Daniel Saidi on 2019-01-26.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import iExtra

class ConcurrentCollectionBatchOperationTests: QuickSpec {
    
    override func spec() {
        
        var obj: TestClass!
        
        beforeEach {
            obj = TestClass()
        }
        
        describe("when performing operation") {
            
            it("completes once for empty sequence") {
                var counter = 0
                obj.perform(onCollection: []) { _ in counter += 1 }
                expect(counter).to(equal(1))
            }
            
            it("completes once for non-empty sequence") {
                var counter = 0
                obj.perform(onCollection: [1, 2, 3, 4, 5]) { _ in counter += 1 }
                expect(counter).to(equal(1))
            }
            
            it("performs operation in batches") {
                obj.batchSize = 2
                obj.perform(onCollection: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]) { _ in }
                expect(obj.result).to(equal([[2, 3], [5, 6], [8, 9], [11, 12], [14, 15]]))
            }
            
            it("performs operation in parallell and is unaffected by halt") {
                obj.batchSize = 2
                obj.performCompletion = false
                obj.perform(onCollection: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]) { _ in }
                expect(obj.result).to(equal([[2, 3], [5, 6], [8, 9], [11, 12], [14, 15]]))
            }
            
            it("ignores invalid batch size") {
                obj.batchSize = 0
                obj.perform(onCollection: [1, 2, 3, 4, 5]) { _ in }
                expect(obj.result).to(equal([[2, 3, 4, 5, 6]]))
            }
            
            it("completes with resulting errors") {
                let error = NSError(domain: "foo", code: 1, userInfo: nil )
                obj.error = error
                obj.batchSize = 2
                var errors = [Error?]()
                obj.perform(onCollection: [1, 2, 3, 4, 5]) { res in errors = res }
                expect(errors.count).to(equal(2))
                expect(errors[0]).to(be(error))
                expect(errors[1]).to(be(error))
            }
        }
    }
}

private class TestClass: ConcurrentCollectionBatchOperation {
    
    typealias OperationItemType = Int
    
    var error: Error?
    var batchSize = 2
    var performCompletion = true
    private(set) var result = [[Int]]()
    private var addon = 1
    
    func perform(onBatch batch: [Int], completion: @escaping BatchCompletion) {
        result.append(batch.map { $0 + addon })
        addon += 1
        guard performCompletion else { return }
        completion(batch.count == 2 ? error: nil)
    }
}
