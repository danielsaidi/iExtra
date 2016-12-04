//
//  UITableView_RegisterTests.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-11-18.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import iExtra
import UIKit

class UITableView_RegisterTests_TestCell: UITableViewCell { }
class UITableView_RegisterTests_TestView: UITableViewHeaderFooterView { }


class UITableView_RegisterTests_TestTable: UITableView {
    
    var executedWithIdentifier: String?
    
    override func register(_ nib: UINib?, forCellReuseIdentifier identifier: String) {
        executedWithIdentifier = identifier
    }
    
    override func register(_ nib: UINib?, forHeaderFooterViewReuseIdentifier identifier: String) {
        executedWithIdentifier = identifier
    }
}



class UITableView_RegisterTests: QuickSpec {
    
    override func spec() {
        
        describe("table view") {
            
            
            var table: UITableView_RegisterTests_TestTable!
            
            beforeEach {
                table = UITableView_RegisterTests_TestTable()
            }
            
            
            describe("registering default cell types") {
                
                it("uses default reuse identifier") {
                    table.registerCell(withType: UITableView_RegisterTests_TestCell.self)
                    let expectedId = UITableView_RegisterTests_TestCell.defaultReuseIdentifier
                    expect(table.executedWithIdentifier).to(equal(expectedId))
                }
            }
            
            
            describe("registering default header footer view") {
                
                it("uses default reuse identifier") {
                    let type = UITableView_RegisterTests_TestView.self
                    table.registerHeaderFooterView(withType: type)
                    let expectedId = UITableView_RegisterTests_TestView.defaultReuseIdentifier
                    expect(table.executedWithIdentifier).to(equal(expectedId))
                }
            }
        }
    }
}

