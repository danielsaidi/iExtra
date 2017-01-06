//
//  SystemNotificationServiceDefault.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-09-29.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import Foundation

open class SystemNotificationServiceDefault: NSObject, SystemNotificationService {

    
    // MARK: - Properties
    
    private var center: NotificationCenter {
        return NotificationCenter.default
    }
    
    
    // MARK: - Functions
    
    open func post(_ notification: String) {
        let name = Notification.Name(notification)
        center.post(name: name, object: nil)
    }
    
    open func post(_ notification: String, object: [AnyHashable: Any]) {
        let name = Notification.Name(notification)
        center.post(name: name, object: nil, userInfo: object)
    }
    
    open func subscribe(_ subscriber: Any, to notification: String, withSelector selector: Selector) {
        let name = Notification.Name(notification)
        center.addObserver(subscriber, selector: selector, name: name, object: nil)
    }
    
    open func unsubscribe(_ subscriber: Any, from notification: String) {
        let name = Notification.Name(notification)
        center.removeObserver(subscriber, name: name, object: nil)
    }
}
