//
//  UITableView_DefaultNibTests.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-11-18.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import iExtra
import UIKit

fileprivate class RegisterTestCell: UITableViewCell { }
fileprivate class RegisterTestCellAlternate: UITableViewCell { }

fileprivate class RegisterTestView: UITableViewHeaderFooterView { }
fileprivate class RegisterTestViewAlternate: UITableViewHeaderFooterView { }

fileprivate class RegisterTestTable: UITableView {
    
    var executedWithIdentifier: String?
    var executedWithIndexPath: IndexPath?
    
    
    override func register(_ nib: UINib?, forCellReuseIdentifier identifier: String) {
        executedWithIdentifier = identifier
    }
    
    override func register(_ nib: UINib?, forHeaderFooterViewReuseIdentifier identifier: String) {
        executedWithIdentifier = identifier
    }
    
    
    override func dequeueReusableCell(withIdentifier identifier: String) -> UITableViewCell? {
        executedWithIdentifier = identifier
        return RegisterTestCell()
    }
    
    override func dequeueReusableCell(withIdentifier identifier: String, for indexPath: IndexPath) -> UITableViewCell {
        executedWithIdentifier = identifier
        executedWithIndexPath = indexPath
        return RegisterTestCell()
    }
    
    override func dequeueReusableHeaderFooterView(withIdentifier identifier: String) -> UITableViewHeaderFooterView? {
        executedWithIdentifier = identifier
        return RegisterTestView()
    }
}



class UITableView_DefaultNibTests: QuickSpec {
    
    override func spec() {
        
        describe("table view") {
            
            
            var table: RegisterTestTable!
            
            beforeEach {
                table = RegisterTestTable()
                table.registerDefaultCell(for: RegisterTestCell.self)
                table.registerDefaultHeaderFooterView(for: RegisterTestView.self)
            }
            
            
            describe("registering cell with default nib") {
                
                it("uses default reuse identifier") {
                    table.registerDefaultCell(for: RegisterTestCell.self)
                    let expectedId = RegisterTestCell.defaultReuseIdentifier
                    expect(table.executedWithIdentifier).to(equal(expectedId))
                }
            }
            
            
            describe("registering header footer view with default nib") {
                
                it("uses default reuse identifier") {
                    table.registerDefaultHeaderFooterView(for: RegisterTestView.self)
                    let expectedId = RegisterTestView.defaultReuseIdentifier
                    expect(table.executedWithIdentifier).to(equal(expectedId))
                }
            }
            
            
            describe("dequeuing cell with default nib") {
                
                it("uses default reuse identifier") {
                    let _: RegisterTestCell? = table.dequeueDefaultCell()
                    let expectedId = RegisterTestCell.defaultReuseIdentifier
                    expect(table.executedWithIdentifier).to(equal(expectedId))
                }
                
                it("returns cell for correct type") {
                    let cell: RegisterTestCell? = table.dequeueDefaultCell()
                    expect(cell).toNot(beNil())
                }
            }
            
            
            describe("dequeuing cell with default nib at path") {
                
                it("uses default reuse identifier and path") {
                    let path = IndexPath(row: 1, section: 2)
                    let _: RegisterTestCell? = table.dequeueDefaultCell(at: path)
                    let expectedId = RegisterTestCell.defaultReuseIdentifier
                    expect(table.executedWithIndexPath).to(equal(path))
                    expect(table.executedWithIdentifier).to(equal(expectedId))
                }
                
                it("returns cell for correct type") {
                    let path = IndexPath(row: 0, section: 0)
                    let cell: RegisterTestCell? = table.dequeueDefaultCell(at: path)
                    expect(cell).toNot(beNil())
                }
            }
            
            
            describe("dequeuing header footer view with default nib") {
                
                it("uses default reuse identifier") {
                    let _: RegisterTestView? = table.dequeueDefaultHeaderFooterView()
                    let expectedId = RegisterTestView.defaultReuseIdentifier
                    expect(table.executedWithIdentifier).to(equal(expectedId))
                }
                
                it("returns cell for correct type") {
                    let cell: RegisterTestView? = table.dequeueDefaultHeaderFooterView()
                    expect(cell).toNot(beNil())
                }
            }
        }
    }
}

