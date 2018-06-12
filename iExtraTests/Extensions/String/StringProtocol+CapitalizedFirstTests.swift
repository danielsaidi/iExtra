//
//  String+CapitalizedFirstTests.swift
//  iExtraTests
//
//  Created by Daniel Saidi on 2018-06-12.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import iExtra

class String_CapitalizedFirstTests: QuickSpec {
    
    override func spec() {
        
        describe("capitalized first") {
            
            it("capitalizes first character and doesn't affect the remaining string") {
                expect("fooBar".capitalizedFirst).to(equal(("FooBar")))
            }
        }
    }
}
