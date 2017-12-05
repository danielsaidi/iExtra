//
//  KeychainBasedDeviceIdentifier.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-11-24.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import Foundation

public class KeychainBasedDeviceIdentifier: NSObject {

    
    // MARK: - Initialization
    
    public init(keychainService: KeychainService, deviceName: String) {
        self.keychainService = keychainService
        self.deviceName = deviceName
        super.init()
    }
    
    
    // MARK: - Properties
    
    fileprivate let deviceName: String
    fileprivate let keychainService: KeychainService
}



// MARK: - DeviceIdentifier

extension KeychainBasedDeviceIdentifier: DeviceIdentifier {
    
    public func getDeviceIdentifier() -> String {
        let key = "device-uuid"
        
        if let keychainId = keychainService.string(for: key, with: nil) {
            return keychainId
        }
        
        let settings = UserDefaults.standard
        if let defaultsId = settings.string(forKey: key) {
            return defaultsId
        }
        
        let id = "\(UUID().uuidString) \(deviceName)"
        keychainService.set(id, for: key, with: nil)
        settings.set(id, forKey: key)
        settings.synchronize()
        
        return id
    }
}
