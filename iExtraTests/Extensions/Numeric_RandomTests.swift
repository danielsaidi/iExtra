//
//  Numeric_RandomTests.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-12-13.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import iExtra

class Numeric_RandomTests: QuickSpec {
    
    override func spec() {
        
        describe("random int") {
            
            it("is always within range") {
                for _ in 0...100 {
                    let value = Int.random(in: 0...100)
                    expect(value).to(beGreaterThanOrEqualTo(0))
                    expect(value).to(beLessThan(101))
                }
            }
        }
        
        
        describe("random double") {
            
            it("is always within range") {
                for _ in 0...100 {
                    let value = Double.random(in: 0...100)
                    expect(value).to(beGreaterThanOrEqualTo(0))
                    expect(value).to(beLessThan(101))
                }
            }
        }
        
        
        describe("random float") {
            
            it("is always within range") {
                for _ in 0...100 {
                    let value = Float.random(in: 0...100)
                    expect(value).to(beGreaterThanOrEqualTo(0))
                    expect(value).to(beLessThan(101))
                }
            }
        }
        
        
        describe("random cgfloat") {
            
            it("is always within range") {
                for _ in 0...100 {
                    let value = CGFloat.random(in: 0...100)
                    expect(value).to(beGreaterThanOrEqualTo(0))
                    expect(value).to(beLessThan(101))
                }
            }
        }
    }
}
