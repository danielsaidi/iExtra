//
//  KeychainServiceTestClass.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-11-24.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import UIKit
import iExtra

class KeychainServiceTestClass: NSObject, KeychainService {
    
    
    // MARK: - KeychainReader
    
    func accessibility(for key: String) -> KeychainItemAccessibility? { return nil }
    func bool(for key: String, with accessibility: KeychainItemAccessibility?) -> Bool? { return nil }
    func data(for key: String, with accessibility: KeychainItemAccessibility?) -> Data? { return nil }
    func dataRef(for key: String, with accessibility: KeychainItemAccessibility?) -> Data? { return nil }
    func double(for key: String, with accessibility: KeychainItemAccessibility?) -> Double? { return nil }
    func float(for key: String, with accessibility: KeychainItemAccessibility?) -> Float? { return nil }
    func hasValue(for key: String, with accessibility: KeychainItemAccessibility?) -> Bool { return false }
    func integer(for key: String, with accessibility: KeychainItemAccessibility?) -> Int? { return nil }
    func object(for key: String, with accessibility: KeychainItemAccessibility?) -> NSCoding? { return nil }
    func string(for key: String, with accessibility: KeychainItemAccessibility?) -> String? { return nil }
    
    
    // MARK: - KeychainWriter
    
    @discardableResult
    func removeObject(for key: String, with accessibility: KeychainItemAccessibility?) -> Bool { return false }
    
    func removeAllKeys() -> Bool { return false }
    
    @discardableResult
    func set(_ value: Bool, for key: String, with accessibility: KeychainItemAccessibility?) -> Bool { return false }
    
    @discardableResult
    func set(_ value: Data, for key: String, with accessibility: KeychainItemAccessibility?) -> Bool { return false }
    
    @discardableResult
    func set(_ value: Double, for key: String, with accessibility: KeychainItemAccessibility?) -> Bool { return false }
    
    @discardableResult
    func set(_ value: Float, for key: String, with accessibility: KeychainItemAccessibility?) -> Bool { return false }
    
    @discardableResult
    func set(_ value: Int, for key: String, with accessibility: KeychainItemAccessibility?) -> Bool { return false }
    
    @discardableResult
    func set(_ value: NSCoding, for key: String, with accessibility: KeychainItemAccessibility?) -> Bool { return false }
    
    @discardableResult
    func set(_ value: String, for key: String, with accessibility: KeychainItemAccessibility?) -> Bool { return false }

}
