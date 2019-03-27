//
//  UIButton+Init.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-12-19.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import UIKit

public extension UIButton {
    
    convenience init(image: UIImage) {
        self.init(type: .custom)
        let size = image.size
        frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        setImage(image, for: .normal)
        setImage(image, for: .highlighted)
        setImage(image, for: .selected)
    }
}
