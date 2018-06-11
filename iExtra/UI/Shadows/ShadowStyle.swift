//
//  BaseViewController.swift
//  Pinny
//
//  Created by Daniel Saidi on 2018-05-09.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

import UIKit

public protocol ShadowStyle {
    
    var alpha: Float { get }
    var blur: CGFloat { get }
    var color: UIColor { get }
    var spread: CGFloat { get }
    var x: CGFloat { get }
    var y: CGFloat { get }
}
