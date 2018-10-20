//
//  UIDevice+UniqueId.swift
//  iExtra
//
//  Created by Daniel Saidi on 2017-12-07.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

import UIKit

public extension UIDevice {
    
    var uniqueId: String {
        let name = UIDevice.current.name
        let encoded = name.base64Encoded() ?? ""
        let trimmed = encoded.trimmingCharacters(in: .whitespacesAndNewlines)
        let hasValue = !trimmed.isEmpty
        return hasValue ? trimmed : "?"
    }
}
