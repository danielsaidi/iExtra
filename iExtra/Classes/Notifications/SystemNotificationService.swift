//
//  SystemNotificationService.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-09-29.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import Foundation

public protocol SystemNotificationService: class {

    func post(_ notification: String)
    func post(_ notification: String, object: [AnyHashable: Any])
    func subscribe(_ subscriber: Any, to notification: String, with selector: Selector)
    func unsubscribe(_ subscriber: Any)
    func unsubscribe(_ subscriber: Any, from notification: String)
}
