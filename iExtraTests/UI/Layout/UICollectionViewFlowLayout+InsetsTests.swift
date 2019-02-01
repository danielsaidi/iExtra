//
//  UICollectionViewFlowLayout+InsetsTests.swift
//  iExtra
//
//  Created by Daniel Saidi on 2019-02-01.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import iExtra

class UICollectionViewFlowLayout_InsetsTests: QuickSpec {
    
    override func spec() {
        
        describe("horizontal insets") {
            
            it("is correctly calculated") {
                let layout = UICollectionViewFlowLayout()
                layout.sectionInset = UIEdgeInsets(top: 11, left: 22, bottom: 33, right: 44)
                expect(layout.horizontalInsets).to(equal(66))
            }
        }
        
        describe("vertical insets") {
            
            it("is correctly calculated") {
                let layout = UICollectionViewFlowLayout()
                layout.sectionInset = UIEdgeInsets(top: 11, left: 22, bottom: 33, right: 44)
                expect(layout.verticalInsets).to(equal(44))
            }
        }
    }
}
