//
//  UISlider+ButtonPositionTests.swift
//  iExtra
//
//  Created by Daniel Saidi Daniel on 2016-12-12.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import iExtra

class UISlider_ButtonPositionTests: QuickSpec {

    override func spec() {
        
        describe("slider button position") {
            
            var slider: UISlider!
            
            beforeEach {
                slider = UISlider()
                slider.bounds = CGRect(x: 0, y: 0, width: 1000, height: 20)
            }
            
            
            context("with normal slider values") {
                
                beforeEach {
                    slider.minimumValue = 0
                    slider.maximumValue = 100
                }
                
                it("handles no progress") {
                    slider.value = 0
                    expect(slider.buttonPosition.rounded()).to(equal(0))
                }
                
                it("handles progress") {
                    slider.value = 30
                    expect(slider.buttonPosition.rounded()).to(equal(300))
                }
                
                it("handles full progress") {
                    slider.value = 100
                    expect(slider.buttonPosition.rounded()).to(equal(1000))
                }
                
                it("handles progress overflow") {
                    slider.value = 110
                    expect(slider.buttonPosition.rounded()).to(equal(1000))
                }
                
                it("handles progress underflow") {
                    slider.value = -10
                    expect(slider.buttonPosition.rounded()).to(equal(0))
                }
            }
            
            
            context("with offset slider values") {
                
                beforeEach {
                    slider.minimumValue = 100
                    slider.maximumValue = 200
                }
                
                it("handles no progress") {
                    slider.value = 100
                    expect(slider.buttonPosition.rounded()).to(equal(0))
                }
                
                it("handles progress") {
                    slider.value = 130
                    expect(slider.buttonPosition.rounded()).to(equal(300))
                }
                
                it("handles full progress") {
                    slider.value = 200
                    expect(slider.buttonPosition.rounded()).to(equal(1000))
                }
                
                it("handles progress overflow") {
                    slider.value = 210
                    expect(slider.buttonPosition.rounded()).to(equal(1000))
                }
                
                it("handles progress underflow") {
                    slider.value = 90
                    expect(slider.buttonPosition.rounded()).to(equal(0))
                }
            }
        }
    }
}
