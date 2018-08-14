//
//  Array+GroupTests.swift
//  iExtra
//
//  Created by Daniel Saidi on 2017-04-05.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import iExtra

private class TestGroupClass: NSObject {
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
        super.init()
    }
    
    var name: String
    var age: Int
}

class Array_GroupTests: QuickSpec {
    
    override func spec() {
        
        func getArray() -> [TestGroupClass] {
            let obj1 = TestGroupClass(name: "Foo", age: 10)
            let obj2 = TestGroupClass(name: "Foo", age: 20)
            let obj3 = TestGroupClass(name: "Bar", age: 20)
            return [obj1, obj2, obj3]
        }
        
        describe("grouping array") {
            
            it("can group by string") {
                let result = getArray().group { $0.name }
                expect(result["Foo"]?.count).to(equal(2))
                expect(result["Bar"]?.count).to(equal(1))
            }
            
            it("can group by int") {
                let result = getArray().group { $0.age }
                expect(result[10]?.count).to(equal(1))
                expect(result[20]?.count).to(equal(2))
            }
        }
    }
}
