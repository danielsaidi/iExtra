//
//  String+Replace.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-01-08.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import Foundation

public extension String {
    
    func replacing(_ string: String, with: String) -> String {
        return replacingOccurrences(of: string, with: with)
    }
    
    func replacing(_ string: String, with: String, caseSensitive: Bool) -> String {
        return caseSensitive
            ? replacing(string, with: with)
            : replacingOccurrences(of: string, with: with, options: .caseInsensitive, range: nil)
    }
}
