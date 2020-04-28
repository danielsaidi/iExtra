//
//  KeychainService.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-11-24.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import Foundation

/**
 This protocol can be implemented by keychain-based services
 that can read from and write to the user's keychain.
 */
public protocol KeychainService: KeychainReader, KeychainWriter { }
