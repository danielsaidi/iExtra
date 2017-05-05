//
//  DateSerializer.swift
//  iExtra
//
//  Created by Daniel Saidi on 2015-01-29.
//  Copyright (c) 2015 Daniel Saidi. All rights reserved.
//

import Foundation

public protocol DateSerializer {
    
    func deserialize(_ string: String) -> Date?
    func serialize(_ date: Date, format: String) -> String
}

public extension DateSerializer {
    
    func serialize(_ date: Date, format: DateSerializerFormat) -> String {
        return serialize(date, format: format.string)
    }
}
