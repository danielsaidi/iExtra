//
//  RemoteNotificationService.swift
//  iExtra
//
//  Created by Daniel Saidi on 2015-10-24.
//  Copyright © 2015 Daniel Saidi. All rights reserved.
//

import Foundation

public protocol RemoteNotificationService {
    
    func alert(notification: [AnyHashable: Any])
    func getDeviceToken(fromData deviceToken: Data) -> String
    func handle(notification: [AnyHashable: Any])
    func registerForRemoteNotifications()
}
