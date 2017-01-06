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



open class StretchableTableViewHeader: StretchableScrollViewHeader {
    
    
    // MARK: - Properties
    
    public var shouldAutosizeToFitSubview = false

    
    
    // MARK: - Functions
    
    open override func handleScroll(in scrollView: UIScrollView) {
        setup(in: scrollView)
        guard let baseHeight = baseHeight else { return }
        frame = getNewFrame(in: scrollView)
        super.handleScroll(in: scrollView)
    }
    
    open override func setup(in scrollView: UIScrollView) {
        guard self.scrollView == nil else { return }
        guard let tableView = scrollView as? UITableView else { return }
        guard self == tableView.tableHeaderView else { return }
        autoresizingMask = [.flexibleWidth]
        tableView.tableHeaderView = UIView.empty
        tableView.addSubview(self)
        super.setup(in: scrollView)
    }
}



// MARK: - Internal Functions

extension StretchableTableViewHeader {
    
    func getNewFrame(in scrollView: UIScrollView) -> CGRect {
        let width = scrollView.bounds.width
        var rect = CGRect(x: 0, y: -baseHeight, width: width, height: baseHeight)
        guard isStretching else { return rect }
        rect.origin.y = scrollView.contentOffset.y
        rect.size.height = -scrollView.contentOffset.y
        return rect
    }
    
    override func handleAutoSizing() {
        guard shouldAutosizeToFitSubview else { return }
        guard let subview = subviews.first else { return }
        let height = subview.frame.size.height
        guard baseHeight != height else { return }
        frame.size.height = height
        super.handleAutoSizing()
    }
}




open class StretchableScrollViewHeader: UIView {
    
    
    // MARK: - View Lifecycle
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        clipsToBounds = true
        guard let scrollView = scrollView else { return }
        handleScroll(in: scrollView)
        handleAutoSizing()
    }
    
    
    
    // MARK: - Properties
    
    public fileprivate(set) var baseHeight: CGFloat!
    
    public var displayHeight: CGFloat {
        guard let view = scrollView else { return frame.size.height }
        return max(0, -view.contentOffset.y)
    }
    
    public var displayHeightFactor: CGFloat {
        guard let view = scrollView else { return 1 }
        return displayHeight / baseHeight
    }
    
    public var isStretching: Bool {
        guard let view = scrollView else { return false }
        return view.contentOffset.y < -baseHeight
    }
    
    
    
    // MARK: - Properties
    
    fileprivate weak var scrollView: UIScrollView?
    
    
    
    // MARK: - Public Functions
    
    open func handleScroll(in scrollView: UIScrollView) {
        guard superview != scrollView else { return }
        /////
    }
    
    open func setup(in scrollView: UIScrollView) {
        self.scrollView = scrollView
        updateBaseHeight()
        handleScroll(in: scrollView)
    }
}



// MARK: - Internal Functions

extension StretchableScrollViewHeader {
    
    func handleAutoSizing() {
        guard baseHeight != frame.size.height else { return }
        updateBaseHeight()
    }
    
    func updateBaseHeight() {
        let height = frame.size.height
        baseHeight = height
        scrollView?.contentOffset = CGPoint(x: 0, y: -height)
        scrollView?.contentInset.top = height
    }
}
