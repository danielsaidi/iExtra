//
//  UIView+VisibilityTests.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-12-12.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import iExtra

class UIView_VisibilityTests: QuickSpec {
    
    override func spec() {
        
        var view: UIView!
        
        beforeEach {
            view = UIView()
        }
        
        
        describe("view") {
            
            describe("visible state") {
            
                it("is inverse of hidden state") {
                    view.isHidden = true
                    expect(view.isVisible).to(equal(false))
                    
                    view.isHidden = false
                    expect(view.isVisible).to(equal(true))
                }
                
                it("sets inverse hidden state") {
                    view.isVisible = true
                    expect(view.isHidden).to(equal(false))
                    
                    view.isVisible = false
                    expect(view.isHidden).to(equal(true))
                }
            }
            
            
            describe("being hidden") {
                
                it("enabled hidden state") {
                    view.isHidden = false
                    view.hide()
                    expect(view.isHidden).to(equal(true))
                }
            }
            
            
            describe("being showed") {
                
                it("enables visible state") {
                    view.isVisible = false
                    view.show()
                    expect(view.isVisible).to(equal(true))
                }
            }
        }
    }

}
