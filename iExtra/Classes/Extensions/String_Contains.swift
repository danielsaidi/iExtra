//
//  String_Contains.swift
//  iExtra
//
//  Created by Daniel Saidi on 2015-02-17.
//  Copyright (c) 2015 Daniel Saidi. All rights reserved.
//

import Foundation

public extension String {
    
    public func contains(other: String, caseInsensitive: Bool) -> Bool {
        return caseInsensitive
            ? self.lowercased().contains(other.lowercased())
            : self.contains(other)
    }
}
