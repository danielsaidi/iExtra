//
//  Pannable.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-03-19.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import Foundation


public protocol PannableDelegate: class {
    func pannableDidBeginPan(_ pannable: Pannable)
    func pannableDidContinuePan(_ pannable: Pannable)
    func pannableDidEndPan(_ pannable: Pannable)
}


public protocol Pannable: class {
    
    weak var panDelegate: PannableDelegate? { get set }
    
    var isPanEnabled: Bool { get set }
    var panDirections: [PannableDirection] { get set }
    var panStartCenter: CGPoint { get set }
}


public extension Pannable {
    
    public var canPanHorizontally: Bool {
        return panDirections.contains(.horizontal)
    }
    
    public var canPanVertically: Bool {
        return panDirections.contains(.vertical)
    }
}


// MARK: - Internal Functions

extension Pannable {
    
    func getNewCenter(for pan: UIPanGestureRecognizer, in view: UIView) -> CGPoint {
        let center = view.center
        let translation = pan.translation(in: view.superview)
        
        var point = CGPoint(x: center.x, y: center.y)
        if canPanHorizontally {
            point.x += translation.x
        }
        
        if canPanVertically {
            point.y += translation.y
        }
        
        pan.setTranslation(CGPoint.zero, in: view.superview)
        return point
    }
    
    func handlePanBase(_ pan: UIPanGestureRecognizer) {
        guard isPanEnabled else { return }
        guard let view = pan.view else { return }
        
        if pan.state == .began {
            panStartCenter = view.center
        }
        
        view.center = getNewCenter(for: pan, in: view)
        
        switch pan.state {
        case .began: panDelegate?.pannableDidBeginPan(self)
        case .changed: panDelegate?.pannableDidContinuePan(self)
        case .ended: panDelegate?.pannableDidEndPan(self)
        default: break
        }
    }
    
    func setupPannable(with action: Selector) {
        guard let _self = self as? UIView else { return }
        _self.isUserInteractionEnabled = true
        let pan = UIPanGestureRecognizer(target: self, action: action)
        _self.addGestureRecognizer(pan)
    }
}
