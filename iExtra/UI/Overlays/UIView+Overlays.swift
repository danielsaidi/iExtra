//
//  UIView+Overlays.swift
//  iExtra
//
//  Created by Daniel Saidi on 2019-02-01.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import UIKit

public extension UIView {

    func addOverlayCheckmark(withSize size: OverlayBadgeView.Size) {
        addOverlayContainer(with: OverlayCheckmark(size: size))
    }
    
    func removeOverlayCheckmark() {
        removeOverlays(ofType: OverlayCheckmark.self)
    }
    
    func removeOverlayViews() {
        removeOverlays(ofType: OverlayView.self)
    }
}

private extension UIView {
    
    func addOverlayContainer<T: OverlayBadgeView>(with view: T) {
        let view = OverlayViewContainer(view: view)
        addSubview(view, fill: true)
    }
    
    func removeOverlays<T: OverlayView>(ofType type: T.Type) {
        subviews
            .filter { $0 is OverlayViewContainer }
            .filter { $0.subviews.first is T }
            .forEach { $0.removeFromSuperview() }
    }
}
