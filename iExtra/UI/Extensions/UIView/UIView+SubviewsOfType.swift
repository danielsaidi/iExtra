//
//  UIView+SubviewsOfType.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-03-13.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import UIKit

public extension UIView {
    
    func subviews<T>(ofType type: T.Type, recursive: Bool = false) -> [T] {
        var views = subviews.compactMap { $0 as? T }
        guard recursive else { return views }
        for view in subviews {
            views += view.subviews(ofType: type, recursive: true)
        }
        return views
    }
}
