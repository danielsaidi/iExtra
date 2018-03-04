//
//  UIImage+Save.swift
//  iExtra
//
//  Created by Daniel Saidi on 2018-02-01.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

/*
 
 This extension can be used to save images to a device photo
 album. The `completionTarget` and `completionSelector` will
 probably be replaced by a callback action later on.
 
 */

import UIKit

extension UIImage {
    
    func saveToPhotos(completionTarget: AnyObject?, completionSelector: Selector) {
        UIImageWriteToSavedPhotosAlbum(self, completionTarget, completionSelector, nil)
    }
}
