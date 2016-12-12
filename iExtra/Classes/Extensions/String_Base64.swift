//
//  String_Base64.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-12-12.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import UIKit

public extension String {
    
    func base64Decoded() -> String? {
        guard let data = Data(base64Encoded: self) else { return nil }
        return String(data: data, encoding: .utf8)
    }
    
    func base64Encoded() -> String? {
        return data(using: .utf8)?.base64EncodedString()
    }
}
