//
//  UIView+Distance.swift
//  Appamini
//
//  Created by Daniel Saidi on 2016-03-14.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

import UIKit

public extension UIView {
    
    func closestView(in views: [UIView]) -> UIView? {
        var distance = CGFloat(Int.max)
        var closest: UIView?
        for view in views {
            let viewDistance = self.distance(to: view)
            if viewDistance < distance && view != self {
                distance = viewDistance
                closest = view
            }
        }
        return closest
    }
    
    func distance(to view: UIView) -> CGFloat {
        guard let viewCenter = superview?.convert(view.center, from: view.superview) else { return -1 }
        let dx = center.x - viewCenter.x
        let dy = center.y - viewCenter.y
        return sqrt(dx * dx + dy * dy)
    }
}
