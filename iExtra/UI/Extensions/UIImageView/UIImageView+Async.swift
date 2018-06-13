//
//  UIImageView+FadeInImage.swift
//  iExtra
//
//  Created by Daniel Saidi on 2017-04-27.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

/*
 
 This is a super-simple way to load async images. However, a
 production app should probably use a more sophisticated way
 to do this, with cached images, cache flush etc.
 
 Have a look at Alamofire or similar libraries for much more
 sophisticated async functionality.
 
 */

import UIKit

public extension UIImageView {
    
    public func loadImageAsync(from url: String, completion: @escaping AsyncImageResult) {
        let tag = setupAsyncTag()
        UIImage.async(from: url) { (image, error) in
            guard self.tag == tag else { return }
            self.fadeInImage(image, withDuration: 0.3)
            completion(image, error)
        }
    }
}
