//
//  UuidGenerator.swift
//  iExtra
//
//  Created by Daniel Saidi on 2014-12-19.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import Foundation

public class UuidGenerator: NSObject, IdGenerator {

    public func generateUniqueId() -> String {
        return NSUUID().uuidString
    }
}
