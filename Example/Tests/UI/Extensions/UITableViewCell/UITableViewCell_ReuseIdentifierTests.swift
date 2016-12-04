//
//  UITableViewCell_ReuseTests.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-11-18.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import iExtra

class UITableViewCell_ReuseTests_Base: UITableViewCell {}
class UITableViewCell_ReuseTests_Sub: UITableViewCell_ReuseTests_Base {}


class UITableViewCell_ReuseIdentifierTests: QuickSpec {
    
    override func spec() {
        
        describe("table view cell") {
            
            describe("default reuse identifier") {
                
                it("handles ui class") {
                    expect(UITableViewCell.defaultReuseIdentifier).to(equal("UITableViewCell"))
                }
                
                it("handles base view") {
                    expect(UITableViewCell_ReuseTests_Base.defaultReuseIdentifier).to(equal("UITableViewCell_ReuseTests_Base"))
                }
                
                it("handles sub view") {
                    expect(UITableViewCell_ReuseTests_Sub.defaultReuseIdentifier).to(equal("UITableViewCell_ReuseTests_Sub"))
                }
            }
        }
    }
}
