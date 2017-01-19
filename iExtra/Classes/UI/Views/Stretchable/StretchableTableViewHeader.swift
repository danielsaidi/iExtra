//
//  StretchableTableViewHeader.swift
//  iExtra
//
//  Created by Daniel Saidi on 2017-01-06.
//  Copyright (c) 2017 Daniel Saidi. All rights reserved.
//

/*
 
 This view inherits `StretchableScrollViewHeader` and is
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
    
    
    // MARK: - Properties
    
    public var shouldAutosizeToFitSubview = false
    
    
    
    // MARK: - Functions
    
    open override func handleScroll(in scrollView: UIScrollView, usingHeightConstraint constraint: NSLayoutConstraint? = nil) {
        setup(in: scrollView as? UITableView)
        handleAutoSizing(in: scrollView)
        super.handleScroll(in: scrollView)
    }
}



// MARK: - Internal Functions

extension StretchableTableViewHeader {
    
    func setup(in tableView: UITableView?) {
        guard let tableView = tableView else { return }
        guard self == tableView.tableHeaderView else { return }
        
        tableView.tableHeaderView = nil
        tableView.backgroundColor = .clear
        tableView.superview!.insertSubview(self, belowSubview: tableView)
        frame.origin.y = tableView.frame.origin.y
        frame.size.width = tableView.frame.size.width
        autoresizingMask = [.flexibleWidth]
    }
    
    func handleAutoSizing(in scrollView: UIScrollView) {
        guard shouldAutosizeToFitSubview else { return }
        guard let subview = subviews.first else { return }
        let height = subview.frame.size.height
        guard shouldResize(toHeight: height) else { return }
        frame.size.height = height
        updateBaseHeight(for: scrollView)
    }
}
