//
//  BatchSequenceOperationTests.swift
//  iExtraTests
//
//  Created by Daniel Saidi on 2019-01-23.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import iExtra

class BatchSequenceOperationTests: QuickSpec {
    
    override func spec() {
        
        var operation: TestClass!
        
        beforeEach {
            operation = TestClass()
        }
        
        describe("when performing operation") {
            
            it("handles empty sequence") {
                var counter = 0
                operation.startOperating(on: [], batchSize: 0) { _ in counter += 1 }
                expect(counter).to(equal(1))
            }
            
            it("performs all operations sequentially") {
                let sequence = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
                operation.startOperating(on: sequence, batchSize: 2) { _ in }
                expect(operation.result).to(equal([[1, 2], [4, 5], [7, 8], [10, 11], [13, 14]]))
            }
            
            it("ignores invalid batch size") {
                let sequence = [1, 2, 3, 4, 5]
                operation.startOperating(on: sequence, batchSize: 0) { _ in }
                expect(operation.result).to(equal([[1, 2, 3, 4, 5]]))
            }
            
            it("completes with resulting errors") {
                let sequence = [1, 2, 3, 4, 5]
                let error = NSError(domain: "foo", code: 1, userInfo: nil )
                operation.error = error
                var result = [Error?]()
                operation.startOperating(on: sequence, batchSize: 2) { errors in
                    result = errors
                }
                expect(result[0]).toEventually(be(error))
                expect(result[1]).toEventually(be(error))
                expect(result[2]).toEventually(beNil())
            }
        }
    }
}

private class TestClass: BatchSequenceOperation {
    
    typealias T = Int
    
    var error: Error?
    var result = [[Int]]()
    private var addon = 0
    
    func performOperation(on batch: [Int], completion: @escaping Completion) {
        result.append(batch.map { $0 + addon })
        addon += 1
        completion(batch.count == 2 ? error: nil)
    }
}
