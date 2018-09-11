//
//  Base64StringEncoder.swift
//  Vandelay
//
//  Created by Daniel Saidi on 2015-03-21.
//  Copyright © 2015 Daniel Saidi. All rights reserved.
//

import Foundation

public class Base64StringCoder: StringEncoder, StringDecoder {
    
    public init() {}
    
    public func decode(string: String) -> String? {
        guard let data = Data(base64Encoded: string, options: .ignoreUnknownCharacters) else { return nil }
        return String(data: data, encoding: .utf8)
    }
    
    public func encode(string: String) -> String? {
        let data = string.data(using: .utf8)
        let encoded = data?.base64EncodedData(options: .endLineWithLineFeed)
        guard encoded != nil else { return nil }
        return String(data: encoded!, encoding: .utf8)
    }
}
