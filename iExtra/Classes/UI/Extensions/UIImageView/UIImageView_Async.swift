//
//  UIImageView_FadeInImage.swift
//  iExtra
//
//  Created by Daniel Saidi on 2017-04-27.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

/*
 
 This is an easy way to load images asynchronously.
 However, production apps should probably use more
 sophisticated ways to do this, with cached images
 etc. Have a look at Kingfisher or any similar lib.
 
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

fileprivate extension UIImageView {
    
    func setupAsyncTag() -> Int {
        tag = Int.random(in: 1...10000)
        return tag
    }
}
