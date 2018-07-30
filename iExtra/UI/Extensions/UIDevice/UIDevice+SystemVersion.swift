//
//  UIDevice+SystemVersion.swift
//  iExtra
//
//  Created by Daniel Saidi on 2017-12-07.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

import UIKit

public extension UIDevice {
    
    var normalizedSystemVersion: String {
        return normalizeSystemVersion(systemVersion)
    }
    
    
    public func normalizeSystemVersion(_ version: String) -> String {
        let components = version.components(separatedBy: ".")
        let dotCount = components.count - 1
        switch dotCount {
        case 0: return "\(version).0.0"
        case 1: return "\(version).0"
        default: return version
        }
    }
    
    public func systemVersion(isAtLeast version: String) -> Bool {
        let systemVersion = normalizedSystemVersion
        let compare = systemVersion.compare(version, options: .numeric)
        return compare != .orderedAscending
    }
    
    public func systemVersion(isLessThan version: String) -> Bool {
        return !systemVersion(isAtLeast: version)
    }
}
