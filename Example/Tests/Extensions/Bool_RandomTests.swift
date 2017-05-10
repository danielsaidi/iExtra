//
//  Bool_RandomTests.swift
//  iExtra
//
//  Created by Saidi Daniel (BookBeat) on 2017-05-10.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import iExtra

class Bool_RandomTests: QuickSpec {
    
    override func spec() {
        
        describe("random bool") {
            
            it("is always within range") {
                var wasTrue = false
                var wasFalse = false
                for _ in 0...100 {
                    let result = Bool.random()
                    wasTrue = wasTrue || result
                    wasFalse = wasFalse || !result
                }
                expect(wasTrue).to(beTrue())
                expect(wasFalse).to(beTrue())
            }
        }
    }
}
