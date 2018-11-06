//
//  UIView+Snapshot.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-01-20.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import UIKit

public extension UIView {
    
    func takeSnapshot() -> UIImage? {
        let scale = UIScreen.main.scale
        UIGraphicsBeginImageContextWithOptions(bounds.size, false, scale)
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        layer.render(in: context)
        guard let image = UIGraphicsGetImageFromCurrentImageContext() else { return nil }
        UIGraphicsEndImageContext()
        return image
    }
    
    func saveSnapshotToPhotoAlbum() {
        guard let image = takeSnapshot() else { return }
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
    }
}
