//
//  KeychainServiceDefault.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-11-24.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

/*
 
 ServiceName is used for the kSecAttrService property, to uniquely identify keychain
 accessor. If no name is specified, it defaults to the bundleIdentifier.
 
 AccessGroup is used for the kSecAttrAccessGroup property to identify which Keychain
 access group this entry belongs to. This allows you to use the KeychainWrapper with
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
    
    private (set) public var serviceName: String
    
    private (set) public var accessGroup: String?
    
    private static let defaultServiceName: String = {
        return Bundle.main.bundleIdentifier ?? "com.danielsaidi.KeychainServiceDefault"
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
