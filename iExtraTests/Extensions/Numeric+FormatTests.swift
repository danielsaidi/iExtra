//
//  Numeric+FormatTests.swift
//  iExtra
//
//  Created by Daniel Saidi on 2015-11-15.
//  Copyright © 2015 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import iExtra

class Float_FormatTests: QuickSpec {
    
    override func spec() {
        
        describe("cgfloat formatting with decimals") {
            
            let value: CGFloat = 123.456789
            
            it("handles no decimals") {
                let result = value.format(withDecimals: 0)
                expect(result).to(equal("123"))
            }
            
            it("handles one decimal") {
                let result = value.format(withDecimals: 1)
                expect(result).to(equal("123.5"))
            }
            
            it("handles two decimals") {
                let result = value.format(withDecimals: 2)
                expect(result).to(equal("123.46"))
            }
        }
        
        describe("double formatting with decimals") {
            
            let value: Double = 123.456789
            
            it("handles no decimals") {
                let result = value.format(withDecimals: 0)
                expect(result).to(equal("123"))
            }
            
            it("handles one decimal") {
                let result = value.format(withDecimals: 1)
                expect(result).to(equal("123.5"))
            }
            
            it("handles two decimals") {
                let result = value.format(withDecimals: 2)
                expect(result).to(equal("123.46"))
            }
        }
        
        describe("float formatting with decimals") {
            
            let value: Float = 123.456789
            
            it("handles no decimals") {
                let result = value.format(withDecimals: 0)
                expect(result).to(equal("123"))
            }
            
            it("handles one decimal") {
                let result = value.format(withDecimals: 1)
                expect(result).to(equal("123.5"))
            }
            
            it("handles two decimals") {
                let result = value.format(withDecimals: 2)
                expect(result).to(equal("123.46"))
            }
        }
    }
}
