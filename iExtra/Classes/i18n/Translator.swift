//
//  Translator.swift
//  iExtra
//
//  Created by Daniel Saidi on 2015-04-15.
//  Copyright © 2015 Daniel Saidi. All rights reserved.
//

import Foundation

public protocol Translator {
    
    func canTranslate(_ key: String) -> Bool
    func translate(_ key: String) -> String
}
