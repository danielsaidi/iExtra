//
//  UIDevice+Properties.swift
//  iExtra
//
//  Created by Daniel Saidi on 2017-12-07.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

import UIKit

public extension UIDevice {
    
    public var isCarPlay: Bool {
        return userInterfaceIdiom == .carPlay
    }
    
    public var isIpad: Bool {
        return userInterfaceIdiom == .pad
    }
    
    public var isIphone: Bool {
        return userInterfaceIdiom == .phone
    }
    
    public var isIphone4: Bool {
        return isIphone && UIScreen.main.bounds.size.height < 500
    }
    
    public var isTV: Bool {
        return userInterfaceIdiom == .tv
    }
}
