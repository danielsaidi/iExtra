//
//  NSObject+ClassNameTests.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-11-18.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import iExtra

class NSObject_ClassNameTests: QuickSpec {
    
    override func spec() {
        
        describe("class name") {
            
            it("is valid for base class") {
                expect(TestParent.className).to(equal("TestParent"))
            }
            
            it("is valid for subclass") {
                expect(TestChild.className).to(equal("TestChild"))
            }
            
            it("is valid for base class instance") {
                expect(TestParent().className).to(equal("TestParent"))
            }
            
            it("is valid for subclass instance") {
                expect(TestChild().className).to(equal("TestChild"))
            }
        }
    }
}

private class TestParent: NSObject {}
private class TestChild: NSObject {}
