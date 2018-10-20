//
//  UIApplication+Name.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-03-09.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import Foundation

public extension UIApplication {
    
    var name: String {
        let value = Bundle.main.infoDictionary?["CFBundleName"]
        return value as? String ?? ""
    }
}
