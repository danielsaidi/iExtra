//
//  FilteredDirectoryFileManager.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-12-19.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import UIKit

open class FilteredDirectoryFileManager: DirectoryFileManagerDefault {
    
    
    // MARK: - Initialization
    
    public init(directory: FileManager.SearchPathDirectory, fileExtensions: [String], fileManager: AppFileManager) {
        self.fileExtensions = fileExtensions
        super.init(directory: directory, fileManager: fileManager)
    }
    
    public init(directoryUrl: URL, fileExtensions: [String], fileManager: AppFileManager) {
        self.fileExtensions = fileExtensions
        super.init(directoryUrl: directoryUrl, fileManager: fileManager)
    }

    
    
    // MARK: - Properties
    
    fileprivate let fileExtensions: [String]
    
    
    
    // MARK: - Public Functions
    
    open override func getFileNames() -> [String] {
        let fileNames = super.getFileNames()
        let fileExtensions = self.fileExtensions.map { $0.lowercased() }
        let result = fileNames.filter {
            let fileName = $0.lowercased()
            return fileExtensions.filter { fileName.hasSuffix($0) }.first != nil
        }
        return result
    }
}
