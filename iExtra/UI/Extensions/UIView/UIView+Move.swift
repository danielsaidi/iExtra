//
//  UIView+Move.swift
//  iExtra
//
//  Created by Daniel Saidi on 2015-04-17.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

import UIKit

public typealias MoveCompletion = (Bool) -> ()

public extension UIView {
    
    func move(toCenter center: CGPoint, withDuration duration: Double, options: UIView.AnimationOptions, completion: MoveCompletion?) {
        let anim = { self.center = center }
        UIView.animate(withDuration: duration, delay: 0, options: options, animations: anim, completion: completion)
    }
    
    func move(toFrame frame: CGRect, withDuration duration: Double, options: UIView.AnimationOptions, completion: MoveCompletion?) {
        let anim = { self.frame = frame }
        UIView.animate(withDuration: duration, delay: 0, options: options, animations: anim, completion: completion)
    }
}
