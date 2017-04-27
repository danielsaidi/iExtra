//
//  UIImageView_FadeInImage.swift
//  iExtra
//
//  Created by Daniel Saidi on 2017-03-31.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

public extension UIImageView {
    
    public func fadeInImage(_ image: UIImage?, withDuration duration: Double) {
        self.image = image
        let transition = CATransition()
        transition.duration = 1.0
        layer.add(transition, forKey: nil)
    }
}
