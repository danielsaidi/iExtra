//
//  StretchableTableViewHeader.swift
//  BBCore
//
//  Created by Daniel Saidi on 2017-01-19.
//  Copyright © 2017 BookBeat. All rights reserved.
//

/*
 
 This view inherits `StretchableScrollViewHeader`. It is
 meant to be used together with a table view, instead of
 with a scroll view.
 
 This view must be the tableHeaderView of the table view.
 It will then detach itself from the table view and move
 below the table view, allowing it to stretch and scroll
 slower than the table view.
 
 Since table view headers have a fixed size, you must do
 some adjustments if the view uses autolayout or resizes
 in any other way. To get auto layout to work, just wrap
 the header view content in a view that uses auto layout
 to automatically resize the wrapper view to its content,
 then set `shouldAutosizeToFitSubview` property to true.
 
 */

import UIKit

open class StretchableTableViewHeader: StretchableScrollViewHeader {
    
    open override func handleScroll(in scrollView: UIScrollView) {
        setup(in: scrollView as? UITableView)
        super.handleScroll(in: scrollView)
    }
}



// MARK: - Internal Functions

extension StretchableTableViewHeader {
    
    func setup(in tableView: UITableView?) {
        guard let tableView = tableView else { return }
        guard self == tableView.tableHeaderView else { return }
        tableView.tableHeaderView = nil
    }
}
