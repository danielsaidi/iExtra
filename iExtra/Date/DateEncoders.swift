//
//  DateEncoders.swift
//  iExtra
//
//  Created by Daniel Saidi on 2018-09-05.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

import Foundation

public extension JSONEncoder {
    
    static var iso8601: JSONEncoder {
        let decoder = JSONEncoder()
        decoder.dateEncodingStrategy = .customISO8601
        return decoder
    }
}

private extension JSONEncoder.DateEncodingStrategy {
    
    static let customISO8601 = custom { (date, encoder) throws -> () in
        let formatter = DateFormatter.iso8601MillisecondFormatter
        let string = formatter.string(from: date)
        var container = encoder.singleValueContainer()
        try container.encode(string)
    }
}
