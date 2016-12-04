//
//  FileFinder.swift
//  iExtra
//
//  Created by Daniel Saidi on 2015-11-15.
//  Copyright © 2015 Daniel Saidi. All rights reserved.
//

import Foundation

public protocol FileFinder {
    
    func findFiles(withPrefix prefix: String) -> [String]
    func findFiles(withSuffix suffix: String) -> [String]
}
