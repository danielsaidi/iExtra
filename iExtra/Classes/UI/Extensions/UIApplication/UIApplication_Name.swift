//
//  UIApplication_Name.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-03-09.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import Foundation

public extension UIApplication {
    
    public var name: String {
        let key = "CFBundleName"
        let value = Bundle.main.infoDictionary?[key]
        return value as? String ?? ""
    }
}
