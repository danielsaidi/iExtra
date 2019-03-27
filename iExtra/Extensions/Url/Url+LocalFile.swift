//
//  Url+LocalFile.swift
//  iExtra
//
//  Created by Daniel Saidi on 2018-08-06.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

import Foundation

public extension URL {
    
    var localFileExists: Bool {
        do {
            return try checkPromisedItemIsReachable()
        } catch {
            return false
        }
    }
}
