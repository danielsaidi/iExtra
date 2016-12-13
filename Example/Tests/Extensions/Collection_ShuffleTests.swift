//
//  Collection_ShuffleTests.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-12-13.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import iExtra

class Collection_ShuffleTests: QuickSpec {
    
    override func spec() {
        
        describe("shuffling a collection") {
            
            it("can create a shuffled copy of a non-mutable array") {
                let array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
                let result = array.shuffled()
                
                expect(result.count).to(equal(10))
                
                var isShuffled = false
                for i in 1...9 {
                    isShuffled = isShuffled || result[i] != i
                }
                
                expect(isShuffled).to(beTrue())
            }
            
            it("can shuffle a mutable array") {
                var array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
                array.shuffle()
                
                expect(array.count).to(equal(10))
                
                var isShuffled = false
                for i in 1...9 {
                    isShuffled = isShuffled || array[i] != i
                }
                
                expect(isShuffled).to(beTrue())
            }
        }
    }
}
