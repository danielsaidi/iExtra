//
//  UITableView_DequeueTests.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-11-18.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import iExtra
import UIKit

class UITableView_DequeueTests: QuickSpec {
    
    override func spec() {
        
        describe("table view") {
            
            
            var table: UITableView_DequeueTests_TestTable!
            
            beforeEach {
                table = UITableView_DequeueTests_TestTable()
            }
            
            
            describe("dequeueing default cell types") {
                
                context("without index path") {
                    
                    it("uses default reuse identifier") {
                        let id = UITableView_RegisterTests_TestCell.defaultReuseIdentifier
                        let type = UITableView_RegisterTests_TestCell.self
                        let _ = table.dequeueCell(withType: type)
                        expect(table.executedWithIdentifier).to(equal(id))
                        expect(table.executedWithIndexPath).to(beNil())
                    }
                }
                
                context("with index path") {
                    
                    it("uses default reuse identifier") {
                        let id = UITableView_RegisterTests_TestCell.defaultReuseIdentifier
                        let indexPath = IndexPath(row: 1, section: 2)
                        let type = UITableView_RegisterTests_TestCell.self
                        let _ = table.dequeueCell(withType: type, for: indexPath)
                        expect(table.executedWithIdentifier).to(equal(id))
                        expect(table.executedWithIndexPath).to(equal(indexPath))
                    }
                }
            }
            
            
            describe("dequeueing default header footer view types") {
                
                it("uses default reuse identifier") {
                    let id = UITableView_RegisterTests_TestView.defaultReuseIdentifier
                    let type = UITableView_RegisterTests_TestView.self
                    let _ = table.dequeueHeaderFooterView(withType: type)
                    expect(table.executedWithIdentifier).to(equal(id))
                }
            }
        }
    }
}



class UITableView_DequeueTests_TestCell: UITableViewCell { }

class UITableView_DequeueTests_TestView: UITableViewHeaderFooterView { }


class UITableView_DequeueTests_TestTable: UITableView {
    
    var executedWithIdentifier: String?
    var executedWithIndexPath: IndexPath?
    
    override func dequeueReusableCell(withIdentifier identifier: String) -> UITableViewCell? {
        executedWithIdentifier = identifier
        return UITableView_DequeueTests_TestCell()
    }
    
    override func dequeueReusableCell(withIdentifier identifier: String, for indexPath: IndexPath) -> UITableViewCell {
        executedWithIdentifier = identifier
        executedWithIndexPath = indexPath
        return UITableView_DequeueTests_TestCell()
    }
    
    override func dequeueReusableHeaderFooterView(withIdentifier identifier: String) -> UITableViewHeaderFooterView? {
        executedWithIdentifier = identifier
        return UITableView_DequeueTests_TestView()
    }
}
