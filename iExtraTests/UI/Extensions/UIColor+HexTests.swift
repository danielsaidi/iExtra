//
//  UIColor_HexTests.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-12-12.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import iExtra

class UIColor_HexTests: QuickSpec {
    
    override func spec() {
        
        describe("color hex string") {
            
            context("by default") {
                
                it("does not use alpha component") {
                    expect(UIColor(hexString: "fa0000").hexString).to(equal("#FA0000"))
                    expect(UIColor(hex: 0x006a00).hexString).to(equal("#006A00"))
                    expect(UIColor(hex: 0x00003D).hexString).to(equal("#00003D"))
                    expect(UIColor(hex: 0xfac3b2).hexString).to(equal("#FAC3B2"))
                }
            }
            
            context("without alpha") {
                
                it("handles single and multi color components") {
                    expect(UIColor(hexString: "fa0000").hexString(withAlpha: false)).to(equal("#FA0000"))
                    expect(UIColor(hex: 0x006a00).hexString(withAlpha: false)).to(equal("#006A00"))
                    expect(UIColor(hex: 0x00003D).hexString(withAlpha: false)).to(equal("#00003D"))
                    expect(UIColor(hex: 0xfac3b2).hexString(withAlpha: false)).to(equal("#FAC3B2"))
                }
            }
            
            context("with alpha") {
                
                it("handles single and multi color components") {
                    expect(UIColor(hexString: "FA00007F").hexString(withAlpha: true)).to(equal("#FA00007F"))
                    expect(UIColor(hex: 0x006a00, alpha: 0.5).hexString(withAlpha: true)).to(equal("#006A007F"))
                    expect(UIColor(hex: 0x00003D, alpha: 1.0).hexString(withAlpha: true)).to(equal("#00003DFF"))
                    expect(UIColor(hex: 0xfac3b2, alpha: 0.5).hexString(withAlpha: true)).to(equal("#FAC3B27F"))
                }
            }
        }
        
    }
}
