//
//  UIView+RoundTests.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-12-12.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import iExtra

class UIView_RoundTests: QuickSpec {
    
    override func spec() {
        
        describe("round view") {
            
            it("is rounded with small height value") {
                let frame = CGRect(x: 0, y: 0, width: 10, height: 100)
                let view = UIView(frame: frame)
                view.roundByHeight()
                expect(view.layer.cornerRadius).to(equal(50))
            }
            
            it("is rounded with small width value") {
                let frame = CGRect(x: 0, y: 0, width: 100, height: 10)
                let view = UIView(frame: frame)
                view.roundByWidth()
                expect(view.layer.cornerRadius).to(equal(50))
            }
            
            it("is rounded with large height value") {
                let frame = CGRect(x: 0, y: 0, width: 10, height: 10000)
                let view = UIView(frame: frame)
                view.roundByHeight()
                expect(view.layer.cornerRadius).to(equal(5000))
            }
            
            it("is rounded with large width value") {
                let frame = CGRect(x: 0, y: 0, width: 10000, height: 10)
                let view = UIView(frame: frame)
                view.roundByWidth()
                expect(view.layer.cornerRadius).to(equal(5000))
            }
        }
    }
}
