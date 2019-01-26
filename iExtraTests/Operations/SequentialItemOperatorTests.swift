//
//  SequentialItemOperatorTests.swift
//  iExtraTests
//
//  Created by Daniel Saidi on 2019-01-23.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import iExtra

class SequentialItemOperatorTests: QuickSpec {
    
    override func spec() {
        
        var obj: TestClass!
        
        beforeEach {
            obj = TestClass()
        }
        
        describe("when performing operation") {
            
            it("handles empty sequence") {
                var counter = 0
                obj.performOperation(on: []) { _ in counter += 1 }
                expect(counter).to(equal(1))
            }
            
            it("performs operation on each item") {
                obj.performOperation(on: [1, 2, 3, 4, 5]) { _ in }
                expect(obj.result).to(equal([2, 4, 6, 8, 10]))
            }
            
            it("performs operation sequentially and is affected by halt") {
                obj.performCompletion = false
                obj.performOperation(on: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]) { _ in }
                expect(obj.result).to(equal([2]))
            }
            
            it("completes with resulting errors") {
                let error = NSError(domain: "foo", code: 1, userInfo: nil )
                obj.error = error
                var result = [Error?]()
                obj.performOperation(on: [1, 2, 3, 4, 5]) { errors in
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

private class TestClass: SequentialItemOperator {
    
    typealias CollectionType = Int
    
    var error: Error?
    var performCompletion = true
    private(set) var result = [Int]()
    private var addon = 1
    
    func performOperation(onItem item: Int, completion: @escaping ItemCompletion) {
        result.append(item + addon)
        addon += 1
        guard performCompletion else { return }
        completion(item % 2 == 0 ? error : nil)
    }
}
