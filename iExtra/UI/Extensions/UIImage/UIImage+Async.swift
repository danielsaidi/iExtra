//
//  UIImage+Async.swift
//  iExtra
//
//  Created by Daniel Saidi on 2017-04-27.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

/*
 
 `async(from:)` is an easy way to load images asynchronously.
 However, production apps should use more sophisticated ways
 to do this, with cached images etc. Check out Kingfisher or
 Alamofire...or any similar lib.
 
 `async(named:)` draws images into a minimal rect and return
 the images. This will cache the images and make them render
 faster later on. This should only be used when you render a
 large amount of small images at the same time. I did use it
 in a keyboard extension with ~60 image buttons.
 
 `async(named:)` uses the ~> operator, which can be found in
 the `Threading` folder.
 
 */

import UIKit

public typealias AsyncImageResult = (_ image: UIImage?, _ error: Error?) -> ()

public extension UIImage {
    
    public static func async(from url: String, completion: @escaping AsyncImageResult) {
        guard let url = URL(string: url) else { return completion(nil, nil) }
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            DispatchQueue.main.async {
                if let error = error { return completion(nil, error ) }
                guard
                    let data = data,
                    let image = UIImage(data: data)
                    else { return completion(nil, nil) }
                completion(image, nil)
            }
        }.resume()
    }
}
