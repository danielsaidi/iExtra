//
//  Array_ElementsOfTypeTests.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-12-13.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import iExtra

class Array_ElementsOfTypeTests: QuickSpec {
    
    override func spec() {
        
        describe("array elements of a certain type") {
            
            it("ignores invalid types") {
                let array: [Any] = [1, "foo", CGFloat(10)]
                let result = array.elementsOfType(type: TestBaseClass.self)
                
                expect(result.count).to(equal(0))
            }
            
            it("returns sub classes only") {
                let array: [Any] = [1, TestBaseClass(), TestSubClass()]
                let result = array.elementsOfType(type: TestSubClass.self)
                
                expect(result.count).to(equal(1))
                expect(result.first!.name).to(equal("sub"))
            }
            
            it("returns sub classes for base class") {
                let array: [Any] = ["foo", TestBaseClass(), TestSubClass()]
                let result = array.elementsOfType(type: TestBaseClass.self)
                
                expect(result.count).to(equal(2))
                expect(result.first!.name).to(equal("base"))
                expect(result.last!.name).to(equal("sub"))
            }
        }
    }
}


fileprivate class TestBaseClass: NSObject {
    
    override init() {
        super.init()
        name = "base"
    }
    
    var name = ""
}

fileprivate class TestSubClass: TestBaseClass {
    
    override init() {
        super.init()
        name = "sub"
    }
}
