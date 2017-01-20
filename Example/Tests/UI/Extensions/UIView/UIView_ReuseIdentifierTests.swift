//
//  UIView_ReuseIdentifierTests.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-11-21.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import iExtra

class UIView_ReuseIdentifierTests_BaseClass: UIView {}
class UIView_ReuseIdentifierTests_SubClass: UIView_ReuseIdentifierTests_BaseClass {}


class UIView_ReuseIdentifierTests: QuickSpec {
    
    override func spec() {
        
        describe("table view header footer view") {
            
            describe("default reuse identifier") {
                
                it("handles ui class") {
                    let id = UIView.defaultReuseIdentifier
                    expect(id).to(equal("UIView"))
                }
                
                it("handles base view") {
                    let id = UIView_ReuseIdentifierTests_BaseClass.defaultReuseIdentifier
                    
                    expect(id).to(equal("UIView_ReuseIdentifierTests_BaseClass"))
                }
                
                it("handles sub view") {
                    let id = UIView_ReuseIdentifierTests_SubClass.defaultReuseIdentifier
                    expect(id).to(equal("UIView_ReuseIdentifierTests_SubClass"))
                }
            }
        }
    }
}
