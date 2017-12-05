//
//  UISlider_Extensions_ValuePercentageTests.swift
//  iExtra
//
//  Created by Daniel Saidi Daniel on 2016-12-12.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import iExtra

class UISlider_Extensions_ValuePercentageTests: QuickSpec {

    override func spec() {
        
        describe("slider value percentage") {
            
            var slider: UISlider!
            
            beforeEach {
                slider = UISlider()
            }
            
            
            context("with normal slider values") {
                
                beforeEach {
                    slider.minimumValue = 0
                    slider.maximumValue = 100
                }
                
                it("handles no progress") {
                    slider.value = 0
                    expect(slider.valuePercentage).to(equal(0))
                }
                
                it("handles progress") {
                    slider.value = 30
                    expect(slider.valuePercentage).to(equal(0.3))
                }
                
                it("handles full progress") {
                    slider.value = 100
                    expect(slider.valuePercentage).to(equal(1.0))
                }
                
                it("handles progress overflow") {
                    slider.value = 110
                    expect(slider.valuePercentage).to(equal(1.0))
                }
                
                it("handles progress underflow") {
                    slider.value = -10
                    expect(slider.valuePercentage).to(equal(0))
                }
            }
            
            
            context("with offset slider values") {
                
                beforeEach {
                    slider.minimumValue = 100
                    slider.maximumValue = 200
                }
                
                it("handles no progress") {
                    slider.value = 100
                    expect(slider.valuePercentage).to(equal(0))
                }
                
                it("handles progress") {
                    slider.value = 130
                    expect(slider.valuePercentage).to(equal(0.3))
                }
                
                it("handles full progress") {
                    slider.value = 200
                    expect(slider.valuePercentage).to(equal(1.0))
                }
                
                it("handles progress overflow") {
                    slider.value = 210
                    expect(slider.valuePercentage).to(equal(1.0))
                }
                
                it("handles progress underflow") {
                    slider.value = 90
                    expect(slider.valuePercentage).to(equal(0))
                }
            }
        }
    }
}
