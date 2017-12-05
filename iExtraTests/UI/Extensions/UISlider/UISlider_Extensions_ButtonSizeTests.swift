//
//  UISlider_Extensions_ButtonPositionTests.swift
//  iExtra
//
//  Created by Daniel Saidi Daniel on 2016-12-12.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import iExtra

class UISlider_Extensions_ButtonSizeTests: QuickSpec {

    override func spec() {
        
        describe("slider button size") {
            
            var slider: UISlider!
            
            beforeEach {
                slider = UISlider()
                slider.bounds = CGRect(x: 0, y: 0, width: 1000, height: 20)
            }
            
            
            it("defaults to frame height") {
                expect(slider.buttonSize).to(equal(20))
                slider.bounds.size.height = 50
                expect(slider.buttonSize).to(equal(50))
            }
        }
    }
}
