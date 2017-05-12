//
//  PannableImageView.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-03-19.
//  Copyright © 2016 Appamini. All rights reserved.
//

import UIKit

open class PannableImageView: UIImageView, Pannable {
    
    
    // MARK: Initialization
    
    public override init(image: UIImage?) {
        super.init(image: image)
        setupPannable(with: #selector(handlePan(_:)))
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupPannable(with: #selector(handlePan(_:)))
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
