//
//  StretchableHeaderView.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-12-19.
//  Copyright (c) 2016 Daniel Saidi. All rights reserved.
//

/*
 
 This view will be stretched when the user pans a scroll
 view in the negative scroll direction, then scroll with
 the scroll view when its content is scrolled.
 
 To use this view with a table view, first add it as the
 table header view. Then, call setup(in:) in viewDidLoad.
 Finally call handleScroll(in:) in scrollViewDidScroll(:).
 
 */

import UIKit

open class StretchableHeaderView: UIView {

    
    // MARK: - Initialization
    
    public convenience init() {
        self.init(frame: CGRect.zero)
        setup()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        guard let scrollView = superview as? UIScrollView else { return }
        handleScroll(in: scrollView)
    }
    
    
    
    // MARK: - Properties
    
    fileprivate var baseHeight: CGFloat!
    
    
    
    // MARK: - Public Functions
    
    open func handleScroll(in scrollView: UIScrollView) {
        frame = getNewFrame(in: scrollView)
    }
    
    open func setup(in tableView: UITableView?) {
        guard let tableView = tableView else { return }
        guard self == tableView.tableHeaderView else { return }
        let height = frame.size.height
        tableView.tableHeaderView = UIView.empty
        tableView.addSubview(self)
        tableView.contentInset = UIEdgeInsets(top: height, left: 0, bottom: 0, right: 0)
        tableView.contentOffset = CGPoint(x: 0, y: -height)
        baseHeight = baseHeight ?? height
        handleScroll(in: tableView)
    }
}



// MARK: - Private Functions

fileprivate extension StretchableHeaderView {
    
    func isStretching(in scrollView: UIScrollView) -> Bool {
        return scrollView.contentOffset.y < -baseHeight
    }
    
    func getNewFrame(in scrollView: UIScrollView) -> CGRect {
        let width = scrollView.bounds.width
        var rect = CGRect(x: 0, y: -baseHeight, width: width, height: baseHeight)
        guard isStretching(in: scrollView) else { return rect }
        rect.origin.y = scrollView.contentOffset.y
        rect.size.height = -scrollView.contentOffset.y
        return rect
    }
    
    func setup() {
        clipsToBounds = true
        baseHeight = frame.size.height
    }
}
