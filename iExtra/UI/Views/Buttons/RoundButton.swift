//
//  RoundButton.swift
//  iExtra
//
//  Created by Daniel Saidi on 2014-12-18.
//  Copyright © 2014 Daniel Saidi. All rights reserved.
//

import UIKit

public final class RoundButton: UIButton {
    
    public static func withColor(_ color: UIColor, andSize size: Int) -> UIButton {
        let origin = CGPoint.zero
        let buttonSize = CGSize(width: size, height: size)
        let button = UIButton(type: .custom)
        button.frame = CGRect(origin: origin, size: buttonSize)
        button.backgroundColor = color
        button.layer.cornerRadius = 0.5 * CGFloat(size)
        return button
    }
}
