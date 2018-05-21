//
//  UICollectionView_DefaultNibTests.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-11-18.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import iExtra
import UIKit


private class RegisterTestCell: UICollectionViewCell { }
private class RegisterTestCellAlternate: UICollectionViewCell { }

private class RegisterTestView: UICollectionView {
    
    var executedWithIdentifier: String?
    var executedWithIndexPath: IndexPath?
    
    
    fileprivate override func register(_ nib: UINib?, forCellWithReuseIdentifier identifier: String) {
        executedWithIdentifier = identifier
    }
    
    
    fileprivate override func dequeueReusableCell(withReuseIdentifier identifier: String, for indexPath: IndexPath) -> UICollectionViewCell {
        executedWithIdentifier = identifier
        executedWithIndexPath = indexPath
        return RegisterTestCell()
    }
}


class UICollectionView_DefaultNibTests: QuickSpec {
    
    override func spec() {
        
        describe("collection view") {
            
            
            var view: RegisterTestView!
            
            beforeEach {
                view = RegisterTestView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout())
                view.registerDefaultCell(for: RegisterTestCell.self)
            }
            
            
            describe("registering cell with default nib") {
                
                it("uses default reuse identifier") {
                    view.registerDefaultCell(for: RegisterTestCell.self)
                    let expectedId = RegisterTestCell.defaultReuseIdentifier
                    expect(view.executedWithIdentifier).to(equal(expectedId))
                }
            }
            
            
            describe("dequeuing cell with default nib at path") {
                
                it("uses default reuse identifier and path") {
                    let path = IndexPath(row: 1, section: 2)
                    let result: RegisterTestCell = view.dequeueDefaultCell(at: path)
                    let expectedId = RegisterTestCell.defaultReuseIdentifier
                    expect(result).toNot(beNil())
                    expect(view.executedWithIndexPath).to(equal(path))
                    expect(view.executedWithIdentifier).to(equal(expectedId))
                }
                
                it("returns cell for correct type") {
                    let path = IndexPath(row: 0, section: 0)
                    let cell: RegisterTestCell = view.dequeueDefaultCell(at: path)
                    expect(cell).toNot(beNil())
                }
            }
        }
    }
}
