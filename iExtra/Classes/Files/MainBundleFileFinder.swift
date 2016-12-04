//
//  MainBundleFileFinder.swift
//  iExtra
//
//  Created by Daniel Saidi on 2015-11-15.
//  Copyright © 2015 Daniel Saidi. All rights reserved.
//

import Foundation

public class MainBundleFileFinder: NSObject, FileFinder {
    
    
    // MARK: Public functions
    
    public func findFiles(withPrefix prefix: String) -> [String] {
        let format = "self BEGINSWITH %@"
        let predicate = NSPredicate(format: format, argumentArray: [prefix])
        return findFiles(with: predicate)
    }
    
    public func findFiles(withSuffix suffix: String) -> [String] {
        let format = "self ENDSWITH %@"
        let predicate = NSPredicate(format: format, argumentArray: [suffix])
        return findFiles(with: predicate)
    }
    
    
    
    // MARK: Private functions
    
    private func findFiles(with predicate: NSPredicate) -> [String] {
        let bundleRoot = Bundle.main.bundlePath
        let fileManager = FileManager.default
        do {
            let files = try fileManager.contentsOfDirectory(atPath: bundleRoot)
            let array = files as NSArray
            let filteredFiles = array.filtered(using: predicate)
            return filteredFiles as! [String]
        } catch {
            return [String]()
        }
    }
}
