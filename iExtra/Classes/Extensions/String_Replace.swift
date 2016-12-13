//
//  String_Replace.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-01-08.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import Foundation

public extension String {
    
    public func replacing(_ string: String, with: String) -> String {
        return self.replacingOccurrences(of: string, with: with)
    }
    
    public func replacing(_ string: String, with: String, caseInsensitive: Bool) -> String {
        return caseInsensitive
            ? self.replacingOccurrences(of: string, with: with, options: .caseInsensitive, range: nil)
            : self.replacing(string, with: with)
    }
}
