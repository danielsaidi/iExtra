//
//  ThinSeparator.swift
//  iExtra
//
//  Created by Daniel Saidi on 2017-05-26.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

import UIKit

open class ThinSeparator: UIView {
    
    
    // MARK: - Overridden Functions
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        setupTrailing()
        adjustHeight()
        adjustWidth()
        adjustX()
        adjustY()
    }
    
    open override func didMoveToSuperview() {
        isTrailingSeparator = nil
        super.didMoveToSuperview()
    }
    
    open override func removeFromSuperview() {
        isTrailingSeparator = nil
        super.removeFromSuperview()
    }
    
    
    // MARK: - Properties
    
    open var lineWidth: CGFloat = 0.5 {
        didSet { setNeedsLayout() }
    }
    
    open var isHeightSeparator: Bool {
        return frame.size.width > frame.size.height
    }
    
    open var isTrailingSeparator: Bool?
    
    open var isWidthSeparator: Bool {
        return !isHeightSeparator
    }
}


// MARK: - Private Functions

private extension ThinSeparator {
    
    func adjustHeight() {
        guard isHeightSeparator else { return }
        frame.size.height = 0.5
    }
    
    func adjustWidth() {
        guard isWidthSeparator else { return }
        frame.size.width = 0.5
    }
    
    func adjustX() {
        guard isWidthSeparator else { return }
        guard isTrailingSeparator == true else { return }
        frame.origin.x = superview!.bounds.maxX - 0.5
    }
    
    func adjustY() {
        guard isHeightSeparator else { return }
        guard isTrailingSeparator == true else { return }
        frame.origin.y = superview!.bounds.maxY - 0.5
    }
    
    func setupTrailing() {
        guard isTrailingSeparator == nil else { return }
        let isTrailingX = isWidthSeparator && frame.maxX == superview?.bounds.maxX
        let isTrailingY = isHeightSeparator && frame.maxY == superview?.bounds.maxY
        isTrailingSeparator = isTrailingX || isTrailingY
    }
}
