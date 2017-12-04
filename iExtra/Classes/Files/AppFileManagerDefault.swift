//
//  AppFileManagerDefault.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-12-19.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import UIKit

open class AppFileManagerDefault: NSObject, AppFileManager {
    
    
    // MARK: - Properties
    
    private var manager: FileManager {
        return FileManager.default
    }
    
    
    // MARK: - Public Functions
    
    open func createFile(at url: URL, contents: Data?) -> Bool {
        return manager.createFile(atPath: url.path, contents: contents, attributes: nil)
    }
    
    open func fileExists(at url: URL) -> Bool {
        return manager.fileExists(atPath: url.path)
    }
    
    open func getAttributesForFile(at url: URL) -> [FileAttributeKey : Any]? {
        do {
            return try manager.attributesOfItem(atPath: url.path)
        } catch {
            return nil
        }
    }
    
    open func getContentsOfDirectory(at url: URL) -> [URL] {
        do {
            return try manager.contentsOfDirectory(at: url, includingPropertiesForKeys: nil, options: .skipsHiddenFiles)
        } catch {
            return [URL]()
        }
    }
    
    open func getSizeOfFile(at url: URL) -> UInt64? {
        guard let attributes = getAttributesForFile(at: url) else { return nil }
        let number = attributes[FileAttributeKey.size] as? NSNumber
        return number?.uint64Value
    }
    
    open func removeFile(at url: URL) -> Bool {
        guard fileExists(at: url) else { return false }
        do {
            try manager.removeItem(at: url)
            return true
        } catch {
            return false
        }
    }
}
