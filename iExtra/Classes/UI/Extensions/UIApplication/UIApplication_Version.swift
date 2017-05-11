//
//  UIApplication_Version.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-01-08.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import UIKit

public extension UIApplication {
    
    public static var buildNumber: String {
        let key = "CFBundleVersion"
        let value = Bundle.main.infoDictionary?[key]
        return value as? String ?? ""
    }
    
    public static var versionNumber: String {
        let key = "CFBundleShortVersionString"
        let value = Bundle.main.infoDictionary?[key]
        return value as? String ?? "0.0.0"
    }
}
