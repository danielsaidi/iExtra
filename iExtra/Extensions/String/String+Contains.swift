//
//  String+Contains.swift
//  iExtra
//
//  Created by Daniel Saidi on 2015-02-17.
//  Copyright © 2015 Daniel Saidi. All rights reserved.
//

import Foundation

public extension String {
    
    public func contains(_ string: String, caseSensitive: Bool) -> Bool {
        return caseSensitive
            ? contains(string)
            : lowercased().contains(string.lowercased())
    }
}
