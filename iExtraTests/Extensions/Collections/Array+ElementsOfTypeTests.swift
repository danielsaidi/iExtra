//
//  Array+ElementsOfTypeTests.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-12-13.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import iExtra

class Array_ElementsOfTypeTests: QuickSpec {
    
    override func spec() {
        
        describe("array elements of a certain type") {
            
            it("ignores invalid types") {
                let array: [Any] = [1, "foo", CGFloat(10)]
                let result = array.elements(ofType: TestBaseClass.self)
                
                expect(result.count).to(equal(0))
            }
            
            it("returns int") {
                let array: [Any] = [20, "foo", CGFloat(10)]
                let result = array.elements(ofType: Int.self)
                
                expect(result.count).to(equal(1))
                expect(result.first!).to(equal(20))
            }
            
            it("returns string") {
                let array: [Any] = [1, "foo", CGFloat(10)]
                let result = array.elements(ofType: String.self)
                
                expect(result.count).to(equal(1))
                expect(result.first!).to(equal("foo"))
            }
            
            it("returns sub classes only") {
                let array: [Any] = [1, TestBaseClass(), TestSubClass()]
                let result = array.elements(ofType: TestSubClass.self)
                
                expect(result.count).to(equal(1))
                expect(result.first!.name).to(equal("sub"))
            }
            
            it("returns sub classes for base class") {
                let array: [Any] = ["foo", TestBaseClass(), TestSubClass()]
                let result = array.elements(ofType: TestBaseClass.self)
                
                expect(result.count).to(equal(2))
                expect(result.first!.name).to(equal("base"))
                expect(result.last!.name).to(equal("sub"))
            }
        }
    }
}


private class TestBaseClass: NSObject {
    
    override init() {
        super.init()
        name = "base"
    }
    
    var name = ""
}

private class TestSubClass: TestBaseClass {
    
    override init() {
        super.init()
        name = "sub"
    }
}
