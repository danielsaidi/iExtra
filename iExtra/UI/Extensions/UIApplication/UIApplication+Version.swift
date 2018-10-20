//
//  UIApplication+Version.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-01-08.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import UIKit

public extension UIApplication {
    
    static var buildNumber: String {
        let value = Bundle.main.infoDictionary?["CFBundleVersion"]
        return value as? String ?? ""
    }
    
    static var versionNumber: String {
        let value = Bundle.main.infoDictionary?["CFBundleShortVersionString"]
        return value as? String ?? "0.0.0"
    }
}
