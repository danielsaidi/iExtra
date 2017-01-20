//
//  StretchableScrollViewHeader.swift
//  iExtra
//
//  Created by Daniel Saidi on 2017-01-19.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

/*
 
 When this view is used as a scroll view header, it will
 stretch out when the user pulls down on the scroll view,
 then scroll away as the user scrolls in the scroll view.
 
 Once you have the header setup, call `handleScroll(in:)`
 in `scrollViewDidScroll(:)` to make the view handle the
 scroll event. Any setup is automatically performed when
 the view is scrolled for the first time.
 
 If you want a parallax effect when you scroll, just set
 the `parallaxFactor` property to a value greater than 0
 and max 1.
 
 */

import UIKit

open class StretchableScrollViewHeader: UIView {
    
    
    // MARK: - Properties
    
    public fileprivate(set) var baseHeight: CGFloat!
    
    public fileprivate(set) var displayHeight: CGFloat = 0
    
    public var displayHeightFactor: CGFloat {
        return displayHeight / (baseHeight ?? 1)
    }
    
    public var isSetup: Bool {
        return baseHeight != nil
    }
    
    public fileprivate(set) var isStretching = false
    
    public var parallaxFactor: CGFloat = 0
    
    public var shouldAutosizeToFitSubview = false
    
    
    
    // MARK: - Private Properties
    
    fileprivate weak var scrollView: UIScrollView?
    
    
    
    // MARK: - Public Functions
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        guard let view = scrollView else { return }
        handleScroll(in: view)
    }
    
    open func handleScroll(in scrollView: UIScrollView) {
        self.scrollView = scrollView
        
        add(to: scrollView)
        handleAutoSizing(in: scrollView)
        updateBaseHeight(for: scrollView)
        isStretching = scrollView.contentOffset.y.rounded() < -baseHeight.rounded()
        
        displayHeight = max(0, -scrollView.contentOffset.y)
        frame = getNewFrame(in: scrollView)
    }
}



// MARK: - Internal Functions

extension StretchableScrollViewHeader {
    
    func shouldResize(toHeight: CGFloat) -> Bool {
        let baseHeight = self.baseHeight ?? 0
        return abs(baseHeight - toHeight) >= 1
    }
    
    func updateBaseHeight(for scrollView: UIScrollView) {
        guard !isStretching else { return }
        let height = frame.size.height
        guard shouldResize(toHeight: height) else { return }
        self.baseHeight = height
        scrollView.contentOffset = CGPoint(x: 0, y: -height)
        scrollView.contentInset.top = height
    }
}



// MARK: - Private Functions

fileprivate extension StretchableScrollViewHeader {
    
    func add(to scrollView: UIScrollView) {
        guard superview != scrollView else { return }
        scrollView.addSubview(self)
        scrollView.sendSubview(toBack: self)
        autoresizingMask = [.flexibleWidth]
    }
    
    func getNewFrame(in scrollView: UIScrollView) -> CGRect {
        let width = scrollView.bounds.width
        var rect = CGRect(x: 0, y: -baseHeight, width: width, height: baseHeight)
        let scrolledPoints = baseHeight - displayHeight
        rect.origin.y += scrolledPoints * min(1, parallaxFactor)
        
        guard isStretching else { return rect }
        rect.origin.y = scrollView.contentOffset.y
        rect.size.height = -scrollView.contentOffset.y
        return rect
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
