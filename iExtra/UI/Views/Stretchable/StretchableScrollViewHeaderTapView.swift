//
//  StretchableScrollViewHeaderTapView.swift
//  iExtra
//
//  Created by Daniel Saidi on 2017-01-19.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

/*
 
 This view is added as a transparent overview, above any
 scroll views that uses a stretchable header. It will be
 resized to cover the visible part of the header, and is
 then responsible for throttling all taps that are meant
 for the header, but (since the table view will cover it)
 won't reach it if this view is not applied.
 
 For now, the class automatically finds all sub views to
 the header, that are enabled and visible and are either
 a button or have a gesture recognizer bound to it. If a
 view that should be tappable fails to be detected, have
 a look at these criterias.
 
 */

import UIKit

public class StretchableScrollViewHeaderTapView: UIView {
    
    
    // MARK: - Properties
    
    weak var header: StretchableScrollViewHeader?
    
    
    // MARK: - Functions
    
    override public func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        guard let header = header else { return nil }
        guard self.point(inside: point, with: event) else { return nil }
        guard let event = event, event.type == .touches else { return nil }
        
        for view in getAllSubviews(in: header) {
            let point = convert(point, to: view)
            let pointInside = view.point(inside: point, with: event)
            if isTappable(view) && pointInside {
                return view
            }
        }
        
        return nil
    }
}


// MARK: - Private Functions

fileprivate extension StretchableScrollViewHeaderTapView {
    
    func getAllSubviews(in view: UIView) -> [UIView] {
        var result = [UIView]()
        for subview in view.subviews {
            result.append(subview)
            result += getAllSubviews(in: subview)
        }
        return result
    }
    
    func isTappable(_ view: UIView) -> Bool {
        let isEnabled = view.isUserInteractionEnabled
        let isButton = view is UIButton
        let hasGestures = (view.gestureRecognizers?.count ?? 0) > 0
        let hasInteraction = isButton || hasGestures
        return !view.isHidden && view.alpha > 0 && isEnabled && hasInteraction
    }
}
