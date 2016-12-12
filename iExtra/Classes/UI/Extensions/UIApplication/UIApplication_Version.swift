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
        let bundle = Bundle.main
        let key = "CFBundleVersion"
        let version = bundle.infoDictionary?[key] as? String
        return version ?? ""
    }
    
    public static var versionNumber: String {
        let bundle = Bundle.main
        let key = "CFBundleShortVersionString"
        let version = bundle.infoDictionary?[key] as? String
        return version ?? "0.0.0"
    }
}
