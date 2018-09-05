//
//  DateDecoders.swift
//  iExtra
//
//  Created by Daniel Saidi on 2018-09-05.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

import Foundation

public extension JSONDecoder {
    
    static var iso8601: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .robustISO8601
        return decoder
    }
}

private extension JSONDecoder.DateDecodingStrategy {
    
    static let robustISO8601 = custom { decoder throws -> Date in
        let container = try decoder.singleValueContainer()
        let string = try container.decode(String.self)
        let milliFormatter = DateFormatter.iso8601MillisecondFormatter
        let secondFormatter = DateFormatter.iso8601SecondFormatter
        if let date = milliFormatter.date(from: string) ?? secondFormatter.date(from: string) { return date }
        throw DecodingError.dataCorruptedError(in: container, debugDescription: "Invalid date: \(string)")
    }
}
