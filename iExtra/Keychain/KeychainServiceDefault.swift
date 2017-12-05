//
//  KeychainServiceDefault.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-11-24.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

/*
 
 `serviceName` is used for `kSecAttrService`, which uniquely
 identifies keychain accessors. If no name is specified, the
 value defaults to the current bundle identifier.
 
 `accessGroup` is used for `kSecAttrAccessGroup`. This value
 is used to identify which keychain access group an entry is
 belonging to. This allows you to use `KeychainWrapper` with
 shared keychain access between different applications.
 
 */

import Foundation


public class KeychainServiceDefault: NSObject {
    
    
    // MARK: - Initialization
    
    public override convenience init() {
        self.init(serviceName: KeychainServiceDefault.defaultServiceName)
    }
    
    public init(serviceName: String, accessGroup: String? = nil) {
        self.serviceName = serviceName
        self.accessGroup = accessGroup
        super.init()
    }

    
    // MARK: - Properties
    
    public let serviceName: String
    
    public let accessGroup: String?
    
    private static let defaultServiceName: String = {
        let defaultId = Bundle.main.bundleIdentifier
        let iExtraId = "com.danielsaidi.iExtra.KeychainServiceDefault"
        return defaultId ?? iExtraId
    }()
}



// MARK: - KeychainReader

extension KeychainServiceDefault: KeychainReader {
    
    public func accessibility(for key: String) -> KeychainItemAccessibility? {
        return KeychainWrapper.standard.accessibilityOfKey(key)
    }
    
    public func bool(for key: String, with accessibility: KeychainItemAccessibility?) -> Bool? {
        return KeychainWrapper.standard.bool(forKey: key, withAccessibility: accessibility)
    }
    
    public func data(for key: String, with accessibility: KeychainItemAccessibility?) -> Data? {
        return KeychainWrapper.standard.data(forKey: key, withAccessibility: accessibility)
    }
    
    public func dataRef(for key: String, with accessibility: KeychainItemAccessibility?) -> Data? {
        return KeychainWrapper.standard.dataRef(forKey: key, withAccessibility: accessibility)
    }
    
    public func double(for key: String, with accessibility: KeychainItemAccessibility?) -> Double? {
        return KeychainWrapper.standard.double(forKey: key, withAccessibility: accessibility)
    }
    
    public func float(for key: String, with accessibility: KeychainItemAccessibility?) -> Float? {
        return KeychainWrapper.standard.float(forKey: key, withAccessibility: accessibility)
    }
    
    public func hasValue(for key: String, with accessibility: KeychainItemAccessibility?) -> Bool {
        return KeychainWrapper.standard.hasValue(forKey: key, withAccessibility: accessibility)
    }
    
    public func integer(for key: String, with accessibility: KeychainItemAccessibility?) -> Int? {
        return KeychainWrapper.standard.integer(forKey: key, withAccessibility: accessibility)
    }
    
    public func object(for key: String, with accessibility: KeychainItemAccessibility?) -> NSCoding? {
        return KeychainWrapper.standard.object(forKey: key, withAccessibility: accessibility)
    }
    
    public func string(for key: String, with accessibility: KeychainItemAccessibility?) -> String? {
        return KeychainWrapper.standard.string(forKey: key, withAccessibility: accessibility)
    }
}


// MARK: - KeychainWriter

extension KeychainServiceDefault: KeychainWriter {
    
    @discardableResult
    public func removeObject(for key: String, with accessibility: KeychainItemAccessibility?) -> Bool {
        return KeychainWrapper.standard.removeObject(forKey: key, withAccessibility: accessibility)
    }
    
    public func removeAllKeys() -> Bool {
        return KeychainWrapper.standard.removeAllKeys()
    }

    @discardableResult
    public func set(_ value: Bool, for key: String, with accessibility: KeychainItemAccessibility?) -> Bool {
        return KeychainWrapper.standard.set(value, forKey: key, withAccessibility: accessibility)
    }
    
    @discardableResult
    public func set(_ value: Data, for key: String, with accessibility: KeychainItemAccessibility?) -> Bool {
        return KeychainWrapper.standard.set(value, forKey: key, withAccessibility: accessibility)
    }
    
    @discardableResult
    public func set(_ value: Double, for key: String, with accessibility: KeychainItemAccessibility?) -> Bool {
        return KeychainWrapper.standard.set(value, forKey: key, withAccessibility: accessibility)
    }
    
    @discardableResult
    public func set(_ value: Float, for key: String, with accessibility: KeychainItemAccessibility?) -> Bool {
        return KeychainWrapper.standard.set(value, forKey: key, withAccessibility: accessibility)
    }
    
    @discardableResult
    public func set(_ value: Int, for key: String, with accessibility: KeychainItemAccessibility?) -> Bool {
        return KeychainWrapper.standard.set(value, forKey: key, withAccessibility: accessibility)
    }
    
    @discardableResult
    public func set(_ value: NSCoding, for key: String, with accessibility: KeychainItemAccessibility?) -> Bool {
        return KeychainWrapper.standard.set(value, forKey: key, withAccessibility: accessibility)
    }
    
    @discardableResult
    public func set(_ value: String, for key: String, with accessibility: KeychainItemAccessibility?) -> Bool {
        return KeychainWrapper.standard.set(value, forKey: key, withAccessibility: accessibility)
    }
}
