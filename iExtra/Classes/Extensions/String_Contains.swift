//
//  String_Contains.swift
//  iExtra
//
//  Created by Daniel Saidi on 2015-02-17.
//  Copyright (c) 2015 Daniel Saidi. All rights reserved.
//

import Foundation

public extension String {
    
    public func contains(string: String, caseInsensitive: Bool) -> Bool {
        let str = self
        return caseInsensitive
            ? str.lowercased().contains(string.lowercased())
            : str.contains(string)
    }
}
