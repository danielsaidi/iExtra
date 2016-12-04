//
//  UIView_Frame.swift
//  iExtra
//
//  Created by Daniel Saidi on 2015-04-17.
//  Copyright (c) 2015 Daniel Saidi. All rights reserved.
//

import UIKit

public extension CGRect {
    
    public var frameAbove: CGRect {
        return CGRect(x: origin.x, y: origin.y - size.height, width: size.width, height: size.height)
    }
    
    public var frameBelow: CGRect {
        return CGRect(x: origin.x, y: origin.y + size.height, width: size.width, height: size.height)
    }
    
    public var frameLeft: CGRect {
        return CGRect(x: origin.x - size.width, y: origin.y, width: size.width, height: size.height)
    }
    
    public var frameRight: CGRect {
        return CGRect(x: origin.x + size.width, y: origin.y, width: size.width, height: size.height)
    }
}


public extension UIView {
    
    public var frameAbove: CGRect { return frame.frameAbove }
    
    public var frameBelow: CGRect { return frame.frameBelow }
    
    public var frameLeft: CGRect { return frame.frameLeft }
    
    public var frameRight: CGRect { return frame.frameRight }
}
