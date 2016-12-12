//
//  String_UrlEncode.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-12-12.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import Foundation

public extension String {
    
    public func urlEncoded() -> String {
        let url = addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? ""
        let and = url.replacingOccurrences(of: "&", with: "%26")
        return and
    }
}
