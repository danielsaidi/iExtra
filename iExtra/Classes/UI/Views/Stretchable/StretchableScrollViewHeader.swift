//
//  StretchableScrollViewHeader.swift
//  iExtra
//
//  Created by Daniel Saidi on 2017-01-06.
//  Copyright (c) 2017 Daniel Saidi. All rights reserved.
//

/*
 
 When this view is used as a scroll view header, it will
 stretch out when the user pulls down on the scroll view,
 then scroll away as the user scrolls.
 
 This view must not be placed in the scroll view that it
 will be the header of. Instead, place it under (z-index)
 the scroll view and align their top and width.
 
 If the view uses auto layout to define its height, call
 `setup(with:heightConstraint:)` once all required views
 are available. If it does not use auto layout, call the
 `setup(with:)` function instead.
 
 Once everything is setup, simply call `handleScroll(in:)`
 in the `scrollViewDidScroll(:)` delegate function. This
 will make the header scroll with the scroll view.
 
 If you want to enable a parallax effect when you scroll,
 set the parallaxFactor property to a value greater than
 zero. The higher the value, the slower the view scrolls
 relative to the scroll view.
 
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
    
    public var parallaxFactor: CGFloat = 0
    
    
    
    // MARK: - Properties
    
    fileprivate weak var heightConstraint: NSLayoutConstraint?
    
    fileprivate weak var scrollView: UIScrollView?
    
    
    
    // MARK: - Public Functions
    
    open func handleScroll(in scrollView: UIScrollView) {
        setup(with: scrollView)
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
        self.heightConstraint = heightConstraint
        setup(with: scrollView)
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
        guard isStretching else { return }
        let newHeight = -scrollView.contentOffset.y
        if let constraint = heightConstraint {
            constraint.constant = newHeight
        } else {
            frame.size.height = newHeight
        }
    }
    
    func updateOffset(for scrollView: UIScrollView) {
        let parallaxFactor = max(0, self.parallaxFactor + 1)
        let offset = isStretching ? 0 : -scrollView.contentOffset.y - baseHeight
        frame.origin.y = offset / parallaxFactor
    }
}
