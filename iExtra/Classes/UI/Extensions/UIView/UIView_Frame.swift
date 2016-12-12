//
//  UIView_Frame.swift
//  iExtra
//
//  Created by Daniel Saidi on 2015-04-17.
//  Copyright (c) 2015 Daniel Saidi. All rights reserved.
//

import UIKit

public extension CGRect {
    
    public var rectAbove: CGRect {
        return CGRect(x: origin.x, y: origin.y - size.height, width: size.width, height: size.height)
    }
    
    public var rectBelow: CGRect {
        return CGRect(x: origin.x, y: origin.y + size.height, width: size.width, height: size.height)
    }
    
    public var rectLeft: CGRect {
        return CGRect(x: origin.x - size.width, y: origin.y, width: size.width, height: size.height)
    }
    
    public var rectRight: CGRect {
        return CGRect(x: origin.x + size.width, y: origin.y, width: size.width, height: size.height)
    }
}


public extension UIView {
    
    public var frameAbove: CGRect { return frame.rectAbove }
    
    public var frameBelow: CGRect { return frame.rectBelow }
    
    public var frameLeft: CGRect { return frame.rectLeft }
    
    public var frameRight: CGRect { return frame.rectRight }
}
