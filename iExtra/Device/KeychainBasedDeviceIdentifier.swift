//
//  KeychainBasedDeviceIdentifier.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-11-24.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import Foundation

public class KeychainBasedDeviceIdentifier {

    
    // MARK: - Initialization
    
    public init(keychainService: KeychainService, deviceName: String) {
        self.keychainService = keychainService
        self.deviceName = deviceName
    }
    
    
    // MARK: - Properties
    
    private let deviceName: String
    private let keychainService: KeychainService
}



// MARK: - DeviceIdentifier

extension KeychainBasedDeviceIdentifier: DeviceIdentifier {
    
    public func getDeviceIdentifier() -> String {
        let key = "device-uuid"
        if let id = keychainService.string(for: key, with: nil) { return id }
        
        let settings = UserDefaults.standard
        if let id = settings.string(forKey: key) { return id }
        
        let id = "\(UUID().uuidString) \(deviceName)"
        keychainService.set(id, for: key, with: nil)
        settings.set(id, forKey: key)
        settings.synchronize()
        
        return id
    }
}
