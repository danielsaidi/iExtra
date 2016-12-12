//
//  Float_FormatTests.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-12-12.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import iExtra

class Float_FormatTests: QuickSpec {
    
    override func spec() {
        
        let float: Float = 123.456789
        
        
        describe("float") {
            
            describe("formatting with string") {
                
                it("handles default format") {
                    let result = float.format()
                    expect(result).to(equal("123.46"))
                }
                
                it("handles no decimals") {
                    let result = float.format(".0")
                    expect(result).to(equal("123"))
                }
                
                it("handles one decimal") {
                    let result = float.format(".1")
                    expect(result).to(equal("123.5"))
                }
                
                it("handles two decimals") {
                    let result = float.format(".2")
                    expect(result).to(equal("123.46"))
                }
            }
            
            describe("formatting with decimals") {
                
                it("handles no decimals") {
                    let result = float.format(withDecimals: 0)
                    expect(result).to(equal("123"))
                }
                
                it("handles one decimal") {
                    let result = float.format(withDecimals: 1)
                    expect(result).to(equal("123.5"))
                }
                
                it("handles two decimals") {
                    let result = float.format(withDecimals: 2)
                    expect(result).to(equal("123.46"))
                }
            }
        }
    }
}
