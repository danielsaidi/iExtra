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
 Unlike `StretchableScrollViewHeader`, you must not call
 a setup function to get it properly configured. It will
 be done automatically when the table view scrolls.
 
 Since table header views have a fixed size, you must do
 some adjustments if the view uses autolayout or resizes
 in any other way, otherwise the table will not adapt to
 any size changes. First, wrap the header content within
 a wrapper view that resizes to fit the content. Second,
 set the `shouldAutosizeToFitSubview` property to true.
 
 */

import UIKit



open class StretchableTableViewHeader: StretchableScrollViewHeader {
    
    
    // MARK: - View Lifecycle
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        handleAutoSizing()
    }
    
    
    
    // MARK: - Properties
    
    public var shouldAutosizeToFitSubview = false

    
    
    // MARK: - Functions
    
    open override func handleScroll(in scrollView: UIScrollView) {
        super.handleScroll(in: scrollView)
        updateFrame(in: scrollView)
    }
    
    open override func setup(with scrollView: UIScrollView) {
        guard let tableView = scrollView as? UITableView else { return }
        guard self == tableView.tableHeaderView else { return }
        autoresizingMask = [.flexibleWidth]
        tableView.tableHeaderView = UIView.empty
        tableView.addSubview(self)
        super.setup(with: scrollView)
    }
}



// MARK: - Internal Functions

extension StretchableTableViewHeader {
    
    func updateFrame(in scrollView: UIScrollView) {
        guard let baseHeight = baseHeight else { return }
        let width = scrollView.bounds.width
        frame = CGRect(x: 0, y: -baseHeight, width: width, height: baseHeight)
        guard isStretching else { return }
        frame.origin.y = scrollView.contentOffset.y
        frame.size.height = -scrollView.contentOffset.y
    }
    
    func handleAutoSizing() {
        guard shouldAutosizeToFitSubview else { return }
        guard let subview = subviews.first else { return }
        let height = subview.frame.size.height
        guard baseHeight != height else { return }
        frame.size.height = height
        guard baseHeight != frame.size.height else { return }
        updateBaseHeight()
    }
}


