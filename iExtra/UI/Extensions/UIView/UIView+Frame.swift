//
//  UIView+Frame.swift
//  iExtra
//
//  Created by Daniel Saidi on 2015-04-17.
//  Copyright © 2015 Daniel Saidi. All rights reserved.
//

import UIKit

public extension UIView {
    
    var frameAbove: CGRect { return frame.rectAbove }
    var frameBelow: CGRect { return frame.rectBelow }
    var frameLeft: CGRect { return frame.rectLeft }
    var frameRight: CGRect { return frame.rectRight }
    
    var screenFrameAbove: CGRect { return frame.screenFrameAbove }
    var screenFrameBelow: CGRect { return frame.screenFrameBelow }
    var screenFrameLeft: CGRect { return frame.screenFrameLeft }
    var screenFrameRight: CGRect { return frame.screenFrameRight }
}
