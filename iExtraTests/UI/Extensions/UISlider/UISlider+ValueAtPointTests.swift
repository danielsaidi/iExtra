//
//  UISlider+ValueAtPointTests.swift
//  iExtra
//
//  Created by Daniel Saidi Daniel on 2016-12-12.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import iExtra

class UISlider_ValueAtPointTests: QuickSpec {

    override func spec() {
        
        describe("slider value at point") {
            
            var slider: UISlider!
            
            beforeEach {
                slider = UISlider()
                slider.bounds = CGRect(x: 100, y: 200, width: 500, height: 20)
            }
            
            
            context("with normal slider values") {
                
                beforeEach {
                    slider.minimumValue = 0
                    slider.maximumValue = 100
                }
                
                it("handles no progress") {
                    let point = CGPoint(x: 0, y: 20)
                    expect(slider.value(at: point)).to(equal(0))
                }
                
                it("handles progress") {
                    let point = CGPoint(x: 250, y: 20)
                    expect(slider.value(at: point)).to(equal(50))
                }
                
                it("handles full progress") {
                    let point = CGPoint(x: 500, y: 20)
                    expect(slider.value(at: point)).to(equal(100))
                }
            }
            
            
            context("with offset slider values") {
                
                beforeEach {
                    slider.minimumValue = 100
                    slider.maximumValue = 200
                }
                
                it("handles no progress") {
                    let point = CGPoint(x: 0, y: 20)
                    expect(slider.value(at: point)).to(equal(100))
                }
                
                it("handles progress") {
                    let point = CGPoint(x: 250, y: 20)
                    expect(slider.value(at: point)).to(equal(150))
                }
                
                it("handles full progress") {
                    let point = CGPoint(x: 500, y: 20)
                    expect(slider.value(at: point)).to(equal(200))
                }
            }
        }
    }
}
