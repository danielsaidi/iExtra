//
//  UIView_HitTestTests.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-12-12.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import iExtra

class UIView_HitTestTests: QuickSpec {
    
    override func spec() {
        
        describe("view hit text") {
            
            var view: UIView!
            var padding: CGSize!
            
            beforeEach {
                view = UIView()
                view.bounds = CGRect(x: 0, y: 0, width: 8, height: 12)
            }
            

            context("with padding") {
                
                beforeEach {
                    padding = CGSize(width: 14, height: 16)
                }
                
                it("succeeds for touches inside touch padding") {
                    var points = [CGPoint]()
                    points.append(CGPoint(x: 0, y: -16))
                    points.append(CGPoint(x: 0, y: 27))
                    points.append(CGPoint(x: -14, y: 0))
                    points.append(CGPoint(x: 21, y: 0))
                    
                    points.forEach {
                        let result = view.point(inside: $0, withPadding: padding, andEvent: nil)
                        expect(result).to(be(true))
                    }
                }
                
                it("fails for touches outside touch padding") {
                    var points = [CGPoint]()
                    points.append(CGPoint(x: 0, y: -17))
                    points.append(CGPoint(x: 0, y: 28))
                    points.append(CGPoint(x: -15, y: 0))
                    points.append(CGPoint(x: 22, y: 0))
                    
                    points.forEach {
                        let result = view.point(inside: $0, withPadding: padding, andEvent: nil)
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
                    points.append(CGPoint(x: 0, y: 0))
                    points.append(CGPoint(x: 0, y: 11))
                    points.append(CGPoint(x: 0, y: 0))
                    points.append(CGPoint(x: 7, y: 0))
                    
                    points.forEach {
                        let result = view.point(inside: $0, withPadding: padding, andEvent: nil)
                        expect(result).to(be(true))
                    }
                }
                
                it("fails for touches outside touch padding") {
                    var points = [CGPoint]()
                    points.append(CGPoint(x: 0, y: -1))
                    points.append(CGPoint(x: 0, y: 12))
                    points.append(CGPoint(x: -1, y: 0))
                    points.append(CGPoint(x: 8, y: 0))
                    
                    points.forEach {
                        let result = view.point(inside: $0, withPadding: padding, andEvent: nil)
                        expect(result).to(be(false))
                    }
                }
            }
        }
    }
}
