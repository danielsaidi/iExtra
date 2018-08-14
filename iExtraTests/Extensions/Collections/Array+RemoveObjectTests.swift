//
//  Array+RemoveObjectTests.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-12-13.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import iExtra

class Array_RemoveObjectTests: QuickSpec {
    
    override func spec() {
        
        describe("removing object from array") {
            
            it("does not remove non-existing int") {
                var array = [1, 2, 3, 4]
                array.remove(object: 5)
                
                expect(array.count).to(equal(4))
                expect(array).to(contain(1))
                expect(array).to(contain(2))
                expect(array).to(contain(3))
                expect(array).to(contain(4))
            }
            
            it("removes existing int") {
                var array = [1, 2, 3, 4]
                array.remove(object: 3)
                
                expect(array.count).to(equal(3))
                expect(array).to(contain(1))
                expect(array).to(contain(2))
                expect(array).to(contain(4))
            }
            
            it("removes existing string") {
                var array = ["foo", "bar", "baz"]
                array.remove(object: "bar")
                
                expect(array.count).to(equal(2))
                expect(array).to(contain("foo"))
                expect(array).to(contain("baz"))
            }
        }
    }
}
