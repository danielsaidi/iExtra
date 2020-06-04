//
//  DateFormatters.swift
//  iExtra
//
//  Created by Daniel Saidi on 2018-09-05.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

import Foundation

public extension DateFormatter {
    
    convenience init(
        dateFormat: String,
        calendar: Calendar = Calendar(identifier: .iso8601),
        locale: Locale = Locale(identifier: "en_US_POSIX"),
        timeZone: TimeZone? = TimeZone(secondsFromGMT: 0)) {
        self.init()
        self.calendar = calendar
        self.locale = locale
        self.dateFormat = dateFormat
        self.timeZone = timeZone
    }
    
    static var iso8601Second: DateFormatter {
        DateFormatter(dateFormat: "yyyy-MM-dd'T'HH:mm:ssZ")
    }
    
    static var iso8601Millisecond: DateFormatter {
        DateFormatter(dateFormat: "yyyy-MM-dd'T'HH:mm:ss.SSSZ")
    }
}
