//
//  UISlider+HitTests.swift
//  iExtra
//
//  Created by Daniel Saidi Daniel on 2016-12-12.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

import UIKit
import Quick
import Nimble
import iExtra

class UISlider_HitTests: QuickSpec {
    
    override func spec() {
        
        describe("slider button hit text") {
            
            var slider: UISlider!
            var padding: CGSize!
            
            beforeEach {
                slider = UISlider()
                slider.bounds = CGRect(x: 0, y: 0, width: 1000, height: 20)
                slider.minimumValue = 100
                slider.maximumValue = 200
                slider.value = 140
            }
            
            
            it("has expected button position") {
                expect(slider.buttonPosition.rounded()).to(equal(400))
            }
            
            it("has expected button position") {
                expect(slider.buttonSize.rounded()).to(equal(20))
            }
            
            
            context("with padding") {
                
                beforeEach {
                    padding = CGSize(width: 20, height: 20)
                }
                
                it("succeeds for touches inside touch padding") {
                    var points = [CGPoint]()
                    points.append(CGPoint(x: 370, y: -10))
                    points.append(CGPoint(x: 430, y: 9))
                    
                    points.forEach {
                        let result = slider.point(insideButton: $0, withPadding: padding, andEvent: nil)
                        expect(result).to(be(true))
                    }
                }
                
                it("fails for touches outside touch padding") {
                    var points = [CGPoint]()
                    points.append(CGPoint(x: 369, y: -10))
                    points.append(CGPoint(x: 431, y: 9))
                    
                    points.forEach {
                        let result = slider.point(insideButton: $0, withPadding: padding, andEvent: nil)
                        expect(result).to(be(false))
                    }
                }
            }
            
            
            context("without padding") {
                
                beforeEach {
                    padding = CGSize.zero
                }
                
                it("succeeds for touches inside touch padding") {
                    var points = [CGPoint]()
                    points.append(CGPoint(x: 390, y: 0))
                    points.append(CGPoint(x: 410, y: 9))
                    
                    points.forEach {
                        let result = slider.point(insideButton: $0, withPadding: padding, andEvent: nil)
                        expect(result).to(be(true))
                    }
                }
                
                it("fails for touches outside touch padding") {
                    var points = [CGPoint]()
                    points.append(CGPoint(x: 389, y: -10))
                    points.append(CGPoint(x: 411, y: 9))
                    
                    points.forEach {
                        let result = slider.point(insideButton: $0, withPadding: padding, andEvent: nil)
                        expect(result).to(be(false))
                    }
                }
            }
        }
    }
}
