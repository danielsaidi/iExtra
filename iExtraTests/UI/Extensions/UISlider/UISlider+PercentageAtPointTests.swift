//
//  UISlider+ValuePercentageTests.swift
//  iExtra
//
//  Created by Daniel Saidi Daniel on 2016-12-12.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import iExtra

class UISlider_PercentageAtPointTests: QuickSpec {
    
    override func spec() {
        
        describe("slider percentage at point") {
            
            var slider: UISlider!
            
            beforeEach {
                slider = UISlider()
                slider.bounds = CGRect(x: 100, y: 200, width: 500, height: 20)
            }
            
            
            it("handles no progress") {
                let point = CGPoint(x: 0, y: 20)
                let percentage = slider.percentage(at: point)
                expect(percentage).to(equal(0))
            }
            
            it("handles progress") {
                let point = CGPoint(x: 250, y: 20)
                let percentage = slider.percentage(at: point)
                expect(percentage).to(equal(0.5))
            }
            
            it("handles full progress") {
                let point = CGPoint(x: 500, y: 20)
                let percentage = slider.percentage(at: point)
                expect(percentage).to(equal(1))
            }
        }
    }
}
