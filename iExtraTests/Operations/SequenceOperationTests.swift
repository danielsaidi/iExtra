//
//  SequenceOperationTests.swift
//  iExtraTests
//
//  Created by Daniel Saidi on 2019-01-23.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import iExtra

class SequenceOperationTests: QuickSpec {
    
    override func spec() {
        
        var operation: TestClass!
        
        beforeEach {
            operation = TestClass()
        }
        
        describe("when performing operation") {
            
            it("handles empty sequence") {
                var counter = 0
                operation.startOperating(on: []) { _ in counter += 1 }
                expect(counter).to(equal(1))
            }
            
            it("performs all operations sequentially") {
                let sequence = [1, 2, 3, 4, 5]
                operation.startOperating(on: sequence) { _ in }
                expect(operation.result).to(equal([1, 3, 5, 7, 9]))
            }
            
            it("completes with resulting errors") {
                let sequence = [1, 2, 3, 4, 5]
                let error = NSError(domain: "foo", code: 1, userInfo: nil )
                operation.error = error
                var result = [Error?]()
                operation.startOperating(on: sequence) { errors in
                    result = errors
                }
                expect(result[0]).toEventually(beNil())
                expect(result[1]).toEventually(be(error))
                expect(result[2]).toEventually(beNil())
                expect(result[3]).toEventually(be(error))
                expect(result[4]).toEventually(beNil())
            }
        }
    }
}

private class TestClass: SequenceOperation {
    
    typealias T = Int
    
    var error: Error?
    var result = [Int]()
    private var addon = 0
    
    func performOperation(on object: Int, completion: @escaping Completion) {
        result.append(object + addon)
        addon += 1
        completion(object.isEven ? error : nil)
    }
}
