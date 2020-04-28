//
//  KeychainReader.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-11-24.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import Foundation

/**
 This protocol can be implemented by keychain-based services
 that can read from the user's keychain.
 */
public protocol KeychainReader: class {

    func accessibility(for key: String) -> KeychainItemAccessibility?
    func bool(for key: String, with accessibility: KeychainItemAccessibility?) -> Bool?
    func data(for key: String, with accessibility: KeychainItemAccessibility?) -> Data?
    func dataRef(for key: String, with accessibility: KeychainItemAccessibility?) -> Data?
    func double(for key: String, with accessibility: KeychainItemAccessibility?) -> Double?
    func float(for key: String, with accessibility: KeychainItemAccessibility?) -> Float?
    func hasValue(for key: String, with accessibility: KeychainItemAccessibility?) -> Bool
    func integer(for key: String, with accessibility: KeychainItemAccessibility?) -> Int?
    func object(for key: String, with accessibility: KeychainItemAccessibility?) -> NSCoding?
    func string(for key: String, with accessibility: KeychainItemAccessibility?) -> String?
}
