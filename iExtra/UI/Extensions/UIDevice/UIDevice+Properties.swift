//
//  UIDevice+Properties.swift
//  iExtra
//
//  Created by Daniel Saidi on 2017-12-07.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

import UIKit

public extension UIDevice {
    
    var isCarPlay: Bool {
        return userInterfaceIdiom == .carPlay
    }
    
    var isIpad: Bool {
        return userInterfaceIdiom == .pad
    }
    
    var isIphone: Bool {
        return userInterfaceIdiom == .phone
    }
    
    var isTV: Bool {
        return userInterfaceIdiom == .tv
    }
}
