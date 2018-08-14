//
//  NSObject+ClassNameTests.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-11-18.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import iExtra

class NSObject_ClassNameTests_Base: NSObject {}
class NSObject_ClassNameTests_Sub: NSObject_ClassNameTests_Base {}

class NSObject_ClassNameTests: QuickSpec {
    
    override func spec() {
        
        describe("object class name") {
            
            it("handles foundation classes") {
                expect(NSObject.className).to(equal("NSObject"))
            }
            
            it("handles ui classes") {
                expect(UIView.className).to(equal("UIView"))
                expect(UITableView.className).to(equal("UITableView"))
                expect(UITableViewCell.className).to(equal("UITableViewCell"))
            }
            
            it("handles base view") {
                let name = NSObject_ClassNameTests_Base.className
                expect(name).to(equal("NSObject_ClassNameTests_Base"))
            }
            
            it("handles sub view") {
                let name = NSObject_ClassNameTests_Sub.className
                expect(name).to(equal("NSObject_ClassNameTests_Sub"))
            }
        }
    }
}
