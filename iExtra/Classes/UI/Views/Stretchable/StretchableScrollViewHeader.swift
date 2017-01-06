//
//  StretchableScrollViewHeader.swift
//  iExtra
//
//  Created by Daniel Saidi on 2017-01-06.
//  Copyright (c) 2017 Daniel Saidi. All rights reserved.
//

/*
 
 When this view is setup as a scrollview header, it will
 stretch out whenever the user pulls down the scrollview,
 then scroll away when the user scrolls.
 
 This view must not be placed within the scrollview that
 it is meant to be the header of. Instead place the view
 below the scrollview and align the top and width of the
 two views.
 
 If the view doesn't use autolayout, you can just set it
 up by calling `setup(with:)`. If it does use autolayout,
 you must call `setup(with:heightConstraint:)` instead.
 
 Once the view is setup, simply call `handleScroll(in:)`
 in the `scrollViewDidScroll(:)` delegate function.
 
 To make the view scroll slower than the scrollview, set
 the `parallaxFactor` property to a value greater than 1.
 
 */

import UIKit


open class StretchableScrollViewHeader: UIView {
    
    
    // MARK: - View Lifecycle
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        clipsToBounds = true
        guard let scrollView = scrollView else { return }
        handleScroll(in: scrollView)
        //handleAutoSizing()
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
    
    public var parallaxFactor: CGFloat = 2.0
    
    
    
    // MARK: - Properties
    
    fileprivate weak var heightConstraint: NSLayoutConstraint?
    
    fileprivate weak var scrollView: UIScrollView?
    
    
    
    // MARK: - Public Functions
    
    open func handleScroll(in scrollView: UIScrollView) {
        setup(with: scrollView)
        guard superview != scrollView else { return }
        updateHeight(for: scrollView)
        updateOffset(for: scrollView)
    }
    
    open func setup(with scrollView: UIScrollView) {
        guard scrollView != self.scrollView else { return }
        self.scrollView = scrollView
        updateBaseHeight()
        handleScroll(in: scrollView)
    }
    
    open func setup(with scrollView: UIScrollView, heightConstraint: NSLayoutConstraint?) {
        guard scrollView != self.scrollView else { return }
        self.heightConstraint = heightConstraint
        self.scrollView = scrollView
        updateBaseHeight()
        handleScroll(in: scrollView)
    }
}



// MARK: - Internal Functions

extension StretchableScrollViewHeader {
    
    func updateBaseHeight() {
        let height = frame.size.height
        baseHeight = height
        scrollView?.contentOffset = CGPoint(x: 0, y: -height)
        scrollView?.contentInset.top = height
    }
    
    func updateHeight(for scrollView: UIScrollView) {
        let newHeight = isStretching ? -scrollView.contentOffset.y : baseHeight
        guard let height = newHeight else { return }
        if let constraint = heightConstraint {
            constraint.constant = height
        } else {
            frame.size.height = height
        }
    }
    
    func updateOffset(for scrollView: UIScrollView) {
        let offset = isStretching ? 0 : -scrollView.contentOffset.y - baseHeight
        frame.origin.y = offset / parallaxFactor
    }
}
