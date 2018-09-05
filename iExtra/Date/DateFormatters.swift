//
//  DateFormatters.swift
//  iExtra
//
//  Created by Daniel Saidi on 2018-09-05.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

import Foundation

public extension DateFormatter {
    
    static func formatter(
        withFormat dateFormat: String,
        calendar: Calendar = Calendar(identifier: .iso8601),
        locale: Locale = Locale(identifier: "en_US_POSIX"),
        timeZone: TimeZone? = TimeZone(secondsFromGMT: 0)) -> DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.calendar = calendar
        dateFormatter.locale = locale
        dateFormatter.dateFormat = dateFormat
        dateFormatter.timeZone = timeZone
        return dateFormatter
    }
    
    static var iso8601SecondFormatter: DateFormatter {
        return formatter(withFormat: "yyyy-MM-dd'T'HH:mm:ssZ")
    }
    
    static var iso8601MillisecondFormatter: DateFormatter {
        return formatter(withFormat: "yyyy-MM-dd'T'HH:mm:ss.SSSZ")
    }
}
