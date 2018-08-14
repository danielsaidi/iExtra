//
//  Array+RandomElementTest.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-12-13.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import iExtra

class Array_RandomElementTests: QuickSpec {
    
    override func spec() {
        
        describe("random element in array") {
            
            let array: [Any] = [TestClass("foo"), 1, "foo", 2, "bar", TestClass("bar")]
            
            it("is cherry picked by int type") {
                let random: Int = array.randomElement()!
                let isValid = random == 1 || random == 2
                expect(isValid).to(beTrue())
            }
            
            it("is random int") {
                var isRandom = false
                var lastValue: Int = array.randomElement()!
                for _ in 0...100 {
                    let value: Int = array.randomElement()!
                    isRandom = isRandom || lastValue != value
                    lastValue = value
                }
                expect(isRandom).to(beTrue())
            }
            
            it("is cherry picked by string type") {
                let random: String = array.randomElement()!
                let isValid = random == "foo" || random == "bar"
                expect(isValid).to(beTrue())
            }
            
            it("is random string") {
                var isRandom = false
                var lastValue: String = array.randomElement()!
                for _ in 0...100 {
                    let value: String = array.randomElement()!
                    isRandom = isRandom || lastValue != value
                    lastValue = value
                }
                expect(isRandom).to(beTrue())
            }
            
            it("is cherry picked by custom type") {
                let random: TestClass = array.randomElement()!
                let isValid = random.name == "foo" || random.name == "bar"
                expect(isValid).to(beTrue())
            }
            
            it("is random custom object") {
                var isRandom = false
                var lastValue: TestClass = array.randomElement()!
                for _ in 0...100 {
                    let value: TestClass = array.randomElement()!
                    isRandom = isRandom || lastValue != value
                    lastValue = value
                }
                expect(isRandom).to(beTrue())
            }
        }
    }
}


private class TestClass: NSObject {
    init(_ name: String) {
        self.name = name
    }
    var name: String
}
