//
//  DeviceIdentifier.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-11-24.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import Foundation

public protocol DeviceIdentifier: class {
    
    func getDeviceIdentifier() -> String
}
