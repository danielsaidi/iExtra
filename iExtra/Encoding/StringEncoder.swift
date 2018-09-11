//
//  StringEncoder.swift
//  iExtra
//
//  Created by Daniel Saidi on 2015-03-21.
//  Copyright © 2015 Daniel Saidi. All rights reserved.
//

import Foundation

public protocol StringEncoder {
    
    func encode(string: String) -> String?
}
