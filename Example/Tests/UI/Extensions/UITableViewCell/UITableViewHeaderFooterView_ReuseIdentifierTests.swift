//
//  UITableViewHeaderFooterView_ReuseTests.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-11-21.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import iExtra

class UITableViewHeaderFooterView_ReuseTests_Base: UITableViewCell {}
class UITableViewHeaderFooterView_ReuseTests_Sub: UITableViewHeaderFooterView_ReuseTests_Base {}


class UITableViewHeaderFooterView_ReuseIdentifierTests: QuickSpec {
    
    override func spec() {
        
        describe("table view header footer view") {
            
            describe("default reuse identifier") {
                
                it("handles ui class") {
                    let id = UITableViewHeaderFooterView.defaultReuseIdentifier
                    expect(id).to(equal("UITableViewHeaderFooterView"))
                }
                
                it("handles base view") {
                    let id = UITableViewHeaderFooterView_ReuseTests_Base.defaultReuseIdentifier
                    expect(id).to(equal("UITableViewHeaderFooterView_ReuseTests_Base"))
                }
                
                it("handles sub view") {
                    let id = UITableViewHeaderFooterView_ReuseTests_Sub.defaultReuseIdentifier
                    expect(id).to(equal("UITableViewHeaderFooterView_ReuseTests_Sub"))
                }
            }
        }
    }
}
