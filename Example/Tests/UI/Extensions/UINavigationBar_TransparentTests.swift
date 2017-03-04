//
//  UINavigationBar_TransparentTests.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-12-12.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import iExtra

class UINavigationBar_TransparentTests: QuickSpec {
    
    override func spec() {
        
        var bar: UINavigationBar!
        
        beforeEach {
            bar = UINavigationBar()
        }
        
        
        describe("navigation bar") {
            
            it("can be made transparent") {
                bar.makeTransparent()
                self.assertTransparent(bar)
            }
            
            it("can be made opaque") {
                bar.makeNonTransparent()
                self.assertNonTransparent(bar)
            }
        }
    }
    
    
    private func assertNonTransparent(_ bar: UINavigationBar) {
        expect(bar.backgroundImage(for: .default)).to(beNil())
        expect(bar.shadowImage).to(beNil())
    }
    
    private func assertTransparent(_ bar: UINavigationBar) {
        expect(bar.backgroundImage(for: .default)).toNot(beNil())
        expect(bar.shadowImage).toNot(beNil())
    }
}
