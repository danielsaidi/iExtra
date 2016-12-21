//
//  StretchableHeaderView.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-12-19.
//  Copyright (c) 2016 Daniel Saidi. All rights reserved.
//

/*
 
 This view is stretched out when the user drags a scroll
 view (e.g. table view) in the negative scroll direction.
 
 To use this view with a table view, first add it as the
 table header view, then call handleScroll(in:) whenever
 scrollViewDidScroll(:) is triggered.
 
 */

import UIKit


open class StretchableHeaderView: UIView {

    
    // MARK: - View Lifecycle
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        guard let scrollView = superview as? UIScrollView else { return }
        handleScroll(in: scrollView)
    }
    
    
    
    // MARK: - Properties
    
    public private(set) var displayHeightScaleFactor: CGFloat = 1
    
    fileprivate var initialHeight: CGFloat!
    
    
    
    // MARK: - Public Functions
    
    open func handleScroll(in scrollView: UIScrollView) {
        clipsToBounds = true
        setup(in: scrollView as? UITableView)
        guard let initialHeight = initialHeight else { return }
        frame = getNewFrame(in: scrollView)
        displayHeightScaleFactor = -scrollView.contentOffset.y / initialHeight
    }
    
    open func setup(in tableView: UITableView?) {
        guard initialHeight == nil else { return }
        guard let tableView = tableView else { return }
        guard self == tableView.tableHeaderView else { return }
        let height = frame.size.height
        tableView.tableHeaderView = UIView.empty
        tableView.addSubview(self)
        tableView.contentInset = UIEdgeInsets(top: height, left: 0, bottom: 0, right: 0)
        tableView.contentOffset = CGPoint(x: 0, y: -height)
        initialHeight = initialHeight ?? height
        handleScroll(in: tableView)
    }
}



// MARK: - Private Functions

fileprivate extension StretchableHeaderView {
    
    func isStretching(in scrollView: UIScrollView) -> Bool {
        return scrollView.contentOffset.y < -initialHeight
    }
    
    func getNewFrame(in scrollView: UIScrollView) -> CGRect {
        let width = scrollView.bounds.width
        var rect = CGRect(x: 0, y: -initialHeight, width: width, height: initialHeight)
        guard isStretching(in: scrollView) else { return rect }
        rect.origin.y = scrollView.contentOffset.y
        rect.size.height = -scrollView.contentOffset.y
        return rect
    }
}
