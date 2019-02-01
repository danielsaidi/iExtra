//
//  UICollectionViewFlowLayout+LayoutTests.swift
//  iExtra
//
//  Created by Daniel Saidi on 2019-02-01.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import iExtra

class UICollectionViewFlowLayout_LayoutTests: QuickSpec {
    
    override func spec() {
        
        describe("layout style") {
            
            let pad = UIUserInterfaceIdiom.pad
            let phone = UIUserInterfaceIdiom.phone
            let appletv = UIUserInterfaceIdiom.tv
            
            it("is correctly evaluated for pad") {
                expect(UICollectionViewFlowLayout.isPadLayoutIdiom(pad)).to(beTrue())
                expect(UICollectionViewFlowLayout.isPadLayoutIdiom(phone)).to(beFalse())
                expect(UICollectionViewFlowLayout.isPadLayoutIdiom(appletv)).to(beFalse())
            }
            
            it("is correctly evaluated for phone") {
                expect(UICollectionViewFlowLayout.isPhoneLayoutIdiom(pad)).to(beFalse())
                expect(UICollectionViewFlowLayout.isPhoneLayoutIdiom(phone)).to(beTrue())
                expect(UICollectionViewFlowLayout.isPhoneLayoutIdiom(appletv)).to(beFalse())
            }
            
            it("is correctly evaluated for tv") {
                expect(UICollectionViewFlowLayout.isTVLayoutIdiom(pad)).to(beFalse())
                expect(UICollectionViewFlowLayout.isTVLayoutIdiom(phone)).to(beFalse())
                expect(UICollectionViewFlowLayout.isTVLayoutIdiom(appletv)).to(beTrue())
            }
        }
    }
}
