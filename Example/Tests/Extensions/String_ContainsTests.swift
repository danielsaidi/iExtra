//
//  String_ContainsTests.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-12-13.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import iExtra

class String_ContainsTests: QuickSpec {
    
    override func spec() {
        
        describe("checking if string contains another string") {
            
            context("with case-sensitive check") {
                
                it("finds existing string") {
                    let result = "foo".contains(other: "foo", caseInsensitive: false)
                    expect(result).to(beTrue())
                }
                
                it("does not find non-existing string") {
                    let result = "foo".contains(other: "foO", caseInsensitive: false)
                    expect(result).to(beFalse())
                }
            }
            
            context("with case-insensitive check") {
                
                it("finds existing string case-sensitively") {
                    let result = "foo".contains(other: "foo", caseInsensitive: true)
                    expect(result).to(beTrue())
                }
                
                it("finds existing string case-insensitively") {
                    let result = "foo".contains(other: "foO", caseInsensitive: true)
                    expect(result).to(beTrue())
                }
                
                it("does not find non-existing string case-sensitively") {
                    let result = "foo".contains(other: "foot", caseInsensitive: true)
                    expect(result).to(beFalse())
                }
            }
        }
    }
}
