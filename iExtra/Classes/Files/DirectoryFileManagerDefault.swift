//
//  DirectoryFileManagerDefault.swift
//  iExtra
//
//  Created by Daniel Saidi on 2015-11-15.
//  Copyright © 2015 Daniel Saidi. All rights reserved.
//

import UIKit

open class DirectoryFileManagerDefault: NSObject, DirectoryFileManager {
    
    
    // MARK: - Initialization
    
    public init(directoryUrl: URL) {
        self.directory = directoryUrl
        super.init()
    }
    
    public init(searchPathDirectory: FileManager.SearchPathDirectory) {
        self.directory = FileManager.default.urls(for: searchPathDirectory, in: .userDomainMask).last!
        super.init()
    }
    
    
    
    // MARK: - Properties
    
    public let directory: URL
    
    private var manager: FileManager {
        return FileManager.default
    }
    
    
    
    // MARK: - Public Functions
    
    open func createFile(withName name: String, contents: Data?) -> Bool {
        let fileUrl = directory.appendingPathComponent(name)
        return manager.createFile(atPath: fileUrl.path, contents: contents, attributes: nil)
    }
    
    open func fileExists(at url: URL) -> Bool {
        return manager.fileExists(atPath: url.path)
    }
    
    public func getAttributesForFile(at url: URL) -> [FileAttributeKey : Any]? {
        do {
            return try manager.attributesOfItem(atPath: url.path)
        } catch {
            return nil
        }
    }
    
    open func getInvalidFilePointers(in collection: [FilePointer]) -> [FilePointer] {
        let fileUrls = getFileUrls()
        let fileNames = fileUrls.map { $0.lastPathComponent }
        return collection.filter { !fileNames.contains($0.fileName) }
    }
    
    open func getFileUrls() -> [URL] {
        do {
            return try manager.contentsOfDirectory(at: directory, includingPropertiesForKeys: nil, options: .skipsHiddenFiles)
        } catch let error as Error {
            return [URL]()
        }
    }
    
    public func getUnreferencedFilesUrls(for pointers: [FilePointer]) -> [URL] {
        let fileUrls = getFileUrls()
        let pointerFileNames = pointers.map { $0.fileName }
        return fileUrls.filter { !pointerFileNames.contains($0.lastPathComponent) }
    }
    
    open func getFileUrls(matching fileNamePatterns: [String]) -> [URL] {
        return getFileUrls().filter {
            let fileName = $0.lastPathComponent.lowercased()
            return fileNamePatterns.first { fileName.contains($0.lowercased()) } != nil
        }
    }
    
    public func getSizeOfFile(at url: URL) -> UInt64? {
        guard let attributes = getAttributesForFile(at: url) else { return nil }
        return attributes[FileAttributeKey.size] as? UInt64
    }
    
    open func getUrlForFile(withName name: String) -> URL? {
        return getFileUrls().first { $0.lastPathComponent == name }
    }
    
    open func getValidFilePointers(in collection: [FilePointer]) -> [FilePointer] {
        let fileUrls = getFileUrls()
        let fileNames = fileUrls.map { $0.lastPathComponent }
        return collection.filter { fileNames.contains($0.fileName) }
    }
    
    open func removeFile(at url: URL) -> Bool {
        guard fileExists(at: url) else {
            return false
        }
        do {
            try manager.removeItem(at: url)
            return true
        } catch let error as Error {
            return false
        }
    }
}
