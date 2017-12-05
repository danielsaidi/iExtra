//
//  PannableImageView.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-03-19.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import UIKit

open class PannableImageView: UIImageView, Pannable {
    
    
    // MARK: Initialization
    
    public override init(image: UIImage?) {
        super.init(image: image)
        setupPannable(with: #selector(triggerPan(_:)))
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupPannable(with: #selector(triggerPan(_:)))
    }
    
    
    // MARK: Properties
    
    open weak var panDelegate: PannableDelegate?
    
    public var isPanEnabled = true
    public var panDirections: [PannableDirection] = [.horizontal, .vertical]
    public var panStartCenter = CGPoint.zero
    
    
    // MARK: - Public Functions
    
    open func handlePan(_ pan: UIPanGestureRecognizer) {
        handlePanBase(pan)
    }
}


// MARK: - Selectors

@objc public extension PannableImageView {
    
    public func triggerPan(_ pan: UIPanGestureRecognizer) {
        handlePan(pan)
    }
}
