//
//  UIView+NibTests.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-12-12.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import iExtra

class UIView_NibTests_Base: UIView {}
class UIView_NibTests_Sub: UIView_NibTests_Base {}


class UIView_NibTests: QuickSpec {
    
    override func spec() {
        
        describe("view") {
            
            describe("default nib name") {
                
                it("handles ui classes") {
                    expect(UIView.defaultNibName).to(equal("UIView"))
                    expect(UITableView.defaultNibName).to(equal("UITableView"))
                    expect(UITableViewCell.defaultNibName).to(equal("UITableViewCell"))
                }
                
                it("handles base view") {
                    expect(UIView_NibTests_Base.defaultNibName).to(equal("UIView_NibTests_Base"))
                }
                
                it("handles sub view") {
                    expect(UIView_NibTests_Sub.defaultNibName).to(equal("UIView_NibTests_Sub"))
                }
            }
        }
    }
}
