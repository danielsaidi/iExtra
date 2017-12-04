//
//  DateSerializerFormat.swift
//  iExtra
//
//  Created by Daniel Saidi on 2017-05-05.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

import Foundation

public enum DateSerializerFormat: String { case
    
    date = "yyyy-MM-dd",
    dateTime = "yyyy-MM-dd'T'HH:mm:ssZ",
    dateTimeWithFragments = "yyyy-MM-dd'T'HH:mm:ss.SSSSSSSZ"
    
    var string: String { return rawValue }
}
