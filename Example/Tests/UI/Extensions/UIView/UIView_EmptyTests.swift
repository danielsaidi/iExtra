//
//  UIView_EmptyTests.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-12-12.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import iExtra

class UIView_EmptyTests: QuickSpec {
    
    override func spec() {
        
        describe("empty view") {
            
            it("has clear background") {
                let view = UIView.empty
                expect(view.backgroundColor).to(equal(UIColor.clear))
            }
            
            it("has zero position") {
                let view = UIView.empty
                let origin = view.frame.origin
                expect(origin.x).to(equal(0))
                expect(origin.y).to(equal(0))
            }
            
            it("has minimum size") {
                let view = UIView.empty
                let size = view.frame.size
                expect(size.width).to(equal(0.01))
                expect(size.height).to(equal(0.01))
            }
        }
    }
}
