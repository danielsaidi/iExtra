//
//  UIButton_ImageMarginTests.swift
//  iExtra
//
//  Created by Daniel Saidi on 2017-04-05.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import iExtra
import UIKit

class UIButton_ImageMarginTests: QuickSpec {
    
    override func spec() {
        
        describe("applying image margins") {
            
            it("can apply small margin") {
                let button = UIButton(type: .custom)
                button.setImageMargin(20.0, withEdgePadding: 30.0)
                expect(button.imageEdgeInsets.left).to(equal(-10.0))
                expect(button.imageEdgeInsets.right).to(equal(10.0))
                expect(button.titleEdgeInsets.left).to(equal(10.0))
                expect(button.titleEdgeInsets.right).to(equal(-10.0))
                expect(button.contentEdgeInsets.left).to(equal(40.0))
                expect(button.contentEdgeInsets.right).to(equal(40.0))
            }
        }
    }
}
