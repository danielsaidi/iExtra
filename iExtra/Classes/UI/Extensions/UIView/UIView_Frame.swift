//
//  UIView_Frame.swift
//  iExtra
//
//  Created by Daniel Saidi on 2015-04-17.
//  Copyright (c) 2015 Daniel Saidi. All rights reserved.
//

import UIKit

public extension UIView {
    
    public var frameAbove: CGRect { return frame.rectAbove }
    
    public var frameBelow: CGRect { return frame.rectBelow }
    
    public var frameLeft: CGRect { return frame.rectLeft }
    
    public var frameRight: CGRect { return frame.rectRight }
    
    
    public var screenFrameAbove: CGRect { return frame.screenFrameAbove }
    
    public var screenFrameBelow: CGRect { return frame.screenFrameBelow }
    
    public var screenFrameLeft: CGRect { return frame.screenFrameLeft }
    
    public var screenFrameRight: CGRect { return frame.screenFrameRight }
}
