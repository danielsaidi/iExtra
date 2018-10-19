//
//  SequenceAssetFinder.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-04-04.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

/*
 
 This class can be used with image assets that have a suffix
 that increments by one. It is setup with a start index then
 tries to load an image per new, incremented index. Whenever
 an image can not be found, all found images are returned.
 
 */

import UIKit

open class SequenceAssetFinder: FileFinder {
    
    
    // MARK: Initialization
    
    public init(startIndex: Int = 1, separator: String = "-") {
        self.startIndex = startIndex
        self.separator = separator
    }
    
    
    // MARK: Properties
    
    private var separator: String
    private var startIndex: Int
    
    
    // MARK: Public functions
    
    public func findFiles(withPrefix prefix: String) -> [String] {
        var result = [String]()
        var index = startIndex
        while true {
            let name = "\(prefix)\(separator)\(index)"
            let image = UIImage(named: name)
            if image == nil { return result }
            result.append(name)
            index += 1
        }
    }
    
    public func findFiles(withSuffix suffix: String) -> [String] {
        return [String]()
    }
}
