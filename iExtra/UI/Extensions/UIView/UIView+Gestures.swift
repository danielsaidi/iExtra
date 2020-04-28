//
//  UIView+Gestures.swift
//  iExtra
//
//  Created by Daniel Saidi on 2020-04-27.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import UIKit

public extension UIView {
    
    func getGestureRecognizers<T: UIGestureRecognizer>(ofType type: T.Type) -> [T] {
        gestureRecognizers?
            .compactMap { $0 as? T } ?? []
    }
    
    func removeAllGestureRecognizers() {
        gestureRecognizers?
            .forEach { removeGestureRecognizer($0) }
    }
    
    func removeGestureRecognizers(_ recognizers: [UIGestureRecognizer]) {
        recognizers
            .forEach { removeGestureRecognizer($0) }
    }
    
    func removeGestureRecognizers<T: UIGestureRecognizer>(ofType type: T.Type) {
        getGestureRecognizers(ofType: type)
            .forEach { removeGestureRecognizer($0) }
    }
}
