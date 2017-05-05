//
//  UIImage_Async.swift
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

public typealias AsyncImageResult = (_ image: UIImage?, _ error: Error?) -> ()

public extension UIImage {
    
    static func async(from url: String, completion: @escaping AsyncImageResult) {
        guard let url = URL(string: url) else { return completion(nil, nil) }
        
        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            DispatchQueue.main.async(execute: {
                if let error = error { return completion(nil, error ) }
                guard
                    let data = data,
                    let image = UIImage(data: data)
                    else { return completion(nil, nil) }
                completion(image, nil)
            })
        }).resume()
    }
}
