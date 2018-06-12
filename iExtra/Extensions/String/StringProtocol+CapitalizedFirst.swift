//
//  String+CapitalizedFirst.swift
//  iExtra
//
//  Created by Daniel Saidi Daniel (BookBeat) on 2018-06-12.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

import Foundation

public extension StringProtocol {
    
    var capitalizedFirst: String {
        guard let first = first else { return "" }
        return String(first).uppercased() + dropFirst()
    }
}
