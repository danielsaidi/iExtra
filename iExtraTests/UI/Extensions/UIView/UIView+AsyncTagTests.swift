//
//  UIView+EmptyTests.swift
//  iExtra
//
//  Created by Daniel Saidi on 2018-06-13.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import iExtra

class UIView_AsyncTagTests: QuickSpec {
    
    override func spec() {
        
        describe("setting up an async tag") {
            
            it("sets and returns a random integer") {
                let view = UIView()
                let tag = view.setupAsyncTag()
                expect(tag).to(beGreaterThanOrEqualTo(0))
                expect(tag).to(beLessThanOrEqualTo(10_000_000))
                expect(view.tag).to(equal(tag))
            }
        }
    }
}
