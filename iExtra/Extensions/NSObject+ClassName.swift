//
//  NSObject+ClassName.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-11-21.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import Foundation

public extension NSObject {
    
    public static var className: String {
        return String(describing: self)
    }
    
    public var className: String {
        return type(of: self).className
    }
}
