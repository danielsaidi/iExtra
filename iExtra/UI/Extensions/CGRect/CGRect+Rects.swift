//
//  CGRect+Rects.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-12-13.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import Foundation

public extension CGRect {
    
    var rectAbove: CGRect {
        CGRect(x: origin.x, y: origin.y - size.height, width: size.width, height: size.height)
    }
    
    var rectBelow: CGRect {
        CGRect(x: origin.x, y: origin.y + size.height, width: size.width, height: size.height)
    }
    
    var rectLeft: CGRect {
        CGRect(x: origin.x - size.width, y: origin.y, width: size.width, height: size.height)
    }
    
    var rectRight: CGRect {
        CGRect(x: origin.x + size.width, y: origin.y, width: size.width, height: size.height)
    }
    
    
    var screenFrameAbove: CGRect {
        CGRect(x: origin.x, y: origin.y - screenSize.height, width: size.width, height: size.height)
    }
    
    var screenFrameBelow: CGRect {
        CGRect(x: origin.x, y: origin.y + screenSize.height, width: size.width, height: size.height)
    }
    
    var screenFrameLeft: CGRect {
        CGRect(x: origin.x - screenSize.width, y: origin.y, width: size.width, height: size.height)
    }
    
    var screenFrameRight: CGRect {
        CGRect(x: origin.x + screenSize.width, y: origin.y, width: size.width, height: size.height)
    }
    
    
    private var screenSize: CGSize {
        UIScreen.main.bounds.size
    }
}
