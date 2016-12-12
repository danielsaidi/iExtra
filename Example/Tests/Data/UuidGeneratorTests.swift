//
//  UuidGenerator.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-12-12.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import Quick
import Nimble
import iExtra

class UuidGeneratorTests: QuickSpec {
    
    override func spec() {
        
        describe("UuidGenerator") {
            
            it("creates an id with correct length") {
                let creator = UuidGenerator()
                let id = creator.generateUniqueId()
                
                expect(id.characters.count).to(equal(36))
            }
            
            it("creates a random password each time") {
                let creator = UuidGenerator()
                let id1 = creator.generateUniqueId()
                let id2 = creator.generateUniqueId()
                
                expect(id1).toNot(equal(id2))
            }
        }
    }
}
