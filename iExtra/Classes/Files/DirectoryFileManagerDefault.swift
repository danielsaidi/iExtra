//
//  DirectoryFileManagerDefault.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-12-19.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import UIKit

open class DirectoryFileManagerDefault: NSObject, DirectoryFileManager {
    
    
    // MARK: - Initialization
    
    public init(directory: FileManager.SearchPathDirectory, fileManager: AppFileManager) {
        self.directory = FileManager.default.urls(for: directory, in: .userDomainMask).last!
        self.manager = fileManager
        super.init()
    }
    
    public init(directoryUrl: URL, fileManager: AppFileManager) {
        self.directory = directoryUrl
        self.manager = fileManager
        super.init()
    }
    
    
    
    // MARK: - Properties
    
    public let directory: URL
    
    fileprivate let manager: AppFileManager
    
    
    
    // MARK: - Public Functions
    
    open func createFile(named name: String, contents: Data?) -> Bool {
        let url = directory.appendingPathComponent(name)
        return manager.createFile(at: url, contents: contents)
    }
    
    open func fileExists(named name: String) -> Bool {
        return getUrlForFile(named: name) != nil
    }
    
    open func getAttributesForFile(named name: String) -> [FileAttributeKey : Any]? {
        guard let url = getUrlForFile(named: name) else { return nil }
        return manager.getAttributesForFile(at: url)
    }
    
    open func getExistingFileNames(in collection: [String]) -> [String] {
        let fileNames = getFileNames()
        return collection.filter { fileNames.contains($0) }
    }
    
    open func getFileNames() -> [String] {
        let urls = manager.getContentsOfDirectory(at: directory)
        return urls.map { $0.lastPathComponent }
    }
    
    open func getFileNames(matching fileNamePatterns: [String]) -> [String] {
        let fileNamePatterns = fileNamePatterns.map { $0.lowercased() }
        return getFileNames().filter {
            let fileName = $0.lowercased()
            return fileNamePatterns.filter { fileName.contains($0) }.first != nil
        }
    }
    
    open func getNonExistingFileNames(in collection: [String]) -> [String] {
        let fileNames = getFileNames()
        return collection.filter { !fileNames.contains($0) }
    }
    
    open func getSizeOfFile(named name: String) -> UInt64? {
        guard let url = getUrlForFile(named: name) else { return nil }
        return manager.getSizeOfFile(at: url)
    }
    
    open func getSizeOfFiles() -> UInt64 {
        let allUrls = getFileNames().map { getUrlForFile(named: $0) }
        let urls = allUrls.filter { $0 != nil }.map { $0! }
        return urls.reduce(0) { $0 + (manager.getSizeOfFile(at: $1) ?? 0) }
    }
    
    open func getUrlForFile(named name: String) -> URL? {
        let urls = manager.getContentsOfDirectory(at: directory)
        return urls.first { $0.lastPathComponent == name }
    }
    
    open func getUnreferencedFileNames(forReferences refs: [String]) -> [String] {
        return getFileNames().filter { !refs.contains($0) }
    }
    
    open func removeFile(named name: String) -> Bool {
        guard let url = getUrlForFile(named: name) else { return false }
        return manager.removeFile(at: url)
    }
}
