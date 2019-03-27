//
//  i18nNotifications.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-03-19.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import Foundation

public extension Notification.Name {
    
    static var languageChanged: Notification.Name {
        return Notification.Name(rawValue: "com.danielsaidi.iExtra.languageChanged")
    }
}
