//
//  DirectoryFileManagerDefaultTests.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-12-19.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import iExtra

class DirectoryFileManagerDefaultTests: QuickSpec {
    
    override func spec() {
        
        describe("default directory file manager") {
            
            var fileManager: TestFileManager!
            let url1 = URL(string: "http://test/fo.o")!
            let url2 = URL(string: "http://test/ba.r")!
            var manager: DirectoryFileManagerDefault!
            var invalidManager: DirectoryFileManagerDefault!
            
            beforeEach {
                fileManager = TestFileManager()
                manager = DirectoryFileManagerDefault(directory: .documentDirectory, fileManager: fileManager)
                invalidManager = DirectoryFileManagerDefault(directoryUrl: url1, fileManager: fileManager)
            }
            
            
            
            context("document folder url") {
                
                it("is resolved for test simulator") {
                    let isDocumentDir = isDocumentDirectoryUrl(manager.directory)
                    expect(isDocumentDir).to(beTrue())
                }
            }
            
            
            context("when creating files") {
                
                it("fails if file could not be created") {
                    let didCreate = manager.createFile(named: "fo.o", contents: nil)
                    expect(didCreate).to(beFalse())
                }
                
                it("can create empty file") {
                    let didCreate = manager.createFile(named: "ba.r", contents: nil)
                    expect(didCreate).to(beTrue())
                    expect(fileManager.createdFileContent).to(beNil())
                    expect(isDocumentDirectoryUrl(fileManager.createdFileUrl!)).to(beTrue())
                    expect(fileManager.createdFileUrl?.lastPathComponent).to(equal("ba.r"))
                }
                
                it("can create non-empty file") {
                    let data = "test".data(using: .utf8)
                    let didCreate = manager.createFile(named: "ba.r", contents: data)
                    expect(didCreate).to(beTrue())
                    expect(String(data: fileManager.createdFileContent!, encoding: .utf8)).to(equal("test"))
                    expect(isDocumentDirectoryUrl(fileManager.createdFileUrl!)).to(beTrue())
                    expect(fileManager.createdFileUrl?.lastPathComponent).to(equal("ba.r"))
                }
            }
            
            
            context("when checking if file exists") {
                
                it("finds existing file") {
                    fileManager.contentsOfDirectory = [url1, url2]
                    expect(manager.fileExists(named: "fo.o")).to(beTrue())
                    expect(manager.fileExists(named: "ba.r")).to(beTrue())
                }
                
                it("does not find non-existing file") {
                    expect(manager.fileExists(named: "fo.o")).to(beFalse())
                    expect(manager.fileExists(named: "ba.r")).to(beFalse())
                }
            }
            
    
            context("when getting attributes for file") {
                
                it("returns nil if file does not exist") {
                    let attributes = manager.getAttributesForFile(named: "ba.r")
                    expect(attributes).to(beNil())
                }
                
                it("returns nil if invalid file exists") {
                    fileManager.contentsOfDirectory = [url1, url2]
                    fileManager.attributes = [.size : 40]
                    let attributes = manager.getAttributesForFile(named: "fo.o")
                    expect(attributes).to(beNil())
                }
                
                it("returns attributes if valid file exists") {
                    fileManager.contentsOfDirectory = [url1, url2]
                    fileManager.attributes = [.size : 40]
                    let attributes = manager.getAttributesForFile(named: "ba.r")
                    expect(attributes?.count).to(equal(1))
                }
            }
            
            
            context("when getting existing file names in collection") {
                
                it("returns no file names if filder does not exist") {
                    fileManager.contentsOfDirectory = [url1, url2]
                    let references = invalidManager.getExistingFileNames(in: ["fo.o", "ba.r"])
                    expect(references.count).to(equal(0))
                }
                
                it("returns no file names if no files exist") {
                    let references = manager.getExistingFileNames(in: ["fo.o", "ba.r"])
                    expect(references.count).to(equal(0))
                }
                
                it("returns single existing file") {
                    fileManager.contentsOfDirectory = [url1, url2]
                    let references = manager.getExistingFileNames(in: ["fo.o", "baz"])
                    expect(references.count).to(equal(1))
                    expect(references.first).to(equal("fo.o"))
                }
                
                it("returns multiple existing files") {
                    fileManager.contentsOfDirectory = [url1, url2]
                    let references = manager.getExistingFileNames(in: ["fo.o", "ba.r"])
                    expect(references.count).to(equal(2))
                    expect(references.first).to(equal("fo.o"))
                    expect(references.last).to(equal("ba.r"))
                }
                
                it("returns no file names if none exist") {
                    fileManager.contentsOfDirectory = [url1, url2]
                    let references = manager.getExistingFileNames(in: ["fo.ol", "baz"])
                    expect(references.count).to(equal(0))
                }
            }
            
            
            context("when getting file names") {
                
                it("returns no file names if folder does not exist") {
                    fileManager.contentsOfDirectory = [url1, url2]
                    let fileNames = invalidManager.getFileNames()
                    expect(fileNames.count).to(equal(0))
                }
                
                it("returns no file names if no files exist") {
                    let fileNames = manager.getFileNames()
                    expect(fileNames.count).to(equal(0))
                }
                
                it("returns names of existing files") {
                    fileManager.contentsOfDirectory = [url1, url2]
                    let fileNames = manager.getFileNames()
                    expect(fileNames.count).to(equal(2))
                    expect(fileNames.first).to(equal(url1.lastPathComponent))
                    expect(fileNames.last).to(equal(url2.lastPathComponent))
                }
            }
            
            
            context("when getting file names matching pattern") {
                
                it("returns no file names if folder does not exist") {
                    fileManager.contentsOfDirectory = [url1, url2]
                    let fileNames = invalidManager.getFileNames(matching: [""])
                    expect(fileNames.count).to(equal(0))
                }
                
                it("returns no file names if no files exist") {
                    let fileNames = manager.getFileNames(matching: [""])
                    expect(fileNames.count).to(equal(0))
                }
                
                it("returns single file name matching single case insensitive pattern") {
                    fileManager.contentsOfDirectory = [url1, url2]
                    let fileNames = manager.getFileNames(matching: ["fo"])
                    expect(fileNames.count).to(equal(1))
                    expect(fileNames.first).to(equal(url1.lastPathComponent))
                }
                
                it("returns single file name matching one of several case insensitive patterns") {
                    fileManager.contentsOfDirectory = [url1, url2]
                    let fileNames = manager.getFileNames(matching: ["fAo", "ba"])
                    expect(fileNames.count).to(equal(1))
                    expect(fileNames.first).to(equal(url2.lastPathComponent))
                }
                
                it("returns many file names matching many case insensitive patterns") {
                    fileManager.contentsOfDirectory = [url1, url2]
                    let fileNames = manager.getFileNames(matching: ["fo", "ba"])
                    expect(fileNames.count).to(equal(2))
                    expect(fileNames.first).to(equal(url1.lastPathComponent))
                    expect(fileNames.last).to(equal(url2.lastPathComponent))
                }
            }
            
            
            context("when getting non-existing file names in collection") {
                
                it("returns all file names if folder does not exist") {
                    fileManager.contentsOfDirectory = [url1, url2]
                    let references = invalidManager.getNonExistingFileNames(in: ["fo.o", "ba.r"])
                    expect(references.count).to(equal(2))
                    expect(references.first).to(equal("fo.o"))
                    expect(references.last).to(equal("ba.r"))
                }
                
                it("returns all file names if no files exist") {
                    let references = manager.getNonExistingFileNames(in: ["fo.o", "ba.r"])
                    expect(references.count).to(equal(2))
                    expect(references.first).to(equal("fo.o"))
                    expect(references.last).to(equal("ba.r"))
                }
                
                it("returns single non-existing file names") {
                    fileManager.contentsOfDirectory = [url1, url2]
                    let references = manager.getNonExistingFileNames(in: ["fo.o", "baz"])
                    expect(references.count).to(equal(1))
                    expect(references.first).to(equal("baz"))
                }
                
                it("returns multiple non-existing file names") {
                    fileManager.contentsOfDirectory = [url1, url2]
                    let references = manager.getNonExistingFileNames(in: ["fo.ol", "baz"])
                    expect(references.count).to(equal(2))
                    expect(references.first).to(equal("fo.ol"))
                    expect(references.last).to(equal("baz"))
                }
                
                it("returns no file names if all exist") {
                    fileManager.contentsOfDirectory = [url1, url2]
                    let references = manager.getNonExistingFileNames(in: ["fo.o", "ba.r"])
                    expect(references.count).to(equal(0))
                }
            }
            
            
            context("when getting size of file") {
                
                it("returns nil if file does not exist") {
                    let size = manager.getSizeOfFile(named: "ba.r")
                    expect(size).to(beNil())
                }
                
                it("returns zero size from manager") {
                    fileManager.contentsOfDirectory = [url1, url2]
                    fileManager.fileSize = 0
                    let size = manager.getSizeOfFile(named: "fo.o")
                    expect(size).to(equal(0))
                }
                
                it("returns non-zero size from manager") {
                    fileManager.contentsOfDirectory = [url1, url2]
                    fileManager.fileSize = 40
                    let size = manager.getSizeOfFile(named: "ba.r")
                    expect(size).to(equal(40))
                }
            }
            
            
            context("when getting size of files matching") {
                
                it("returns zero if no files exist") {
                    let attributes = manager.getSizeOfFiles()
                    expect(attributes).to(equal(0))
                }
                
                it("returns zero for no file size") {
                    fileManager.fileSize = 0
                    fileManager.contentsOfDirectory = [url1, url2]
                    let size = manager.getSizeOfFiles()
                    expect(size).to(equal(0))
                }
                
                it("returns total file size for all files") {
                    fileManager.fileSize = 10
                    fileManager.contentsOfDirectory = [url1, url2]
                    let size = manager.getSizeOfFiles()
                    expect(size).to(equal(20))
                }
            }
            
            
            context("when getting url for file") {
                
                it("returns url if file exists") {
                    fileManager.contentsOfDirectory = [url1, url2]
                    expect(manager.getUrlForFile(named: "fo.o")).to(equal(url1))
                    expect(manager.getUrlForFile(named: "ba.r")).to(equal(url2))
                }
                
                it("returns no url if file does not exist") {
                    let url = manager.getUrlForFile(named: "fo.o")
                    expect(url).to(beNil())
                }
            }
            
            
            context("when getting unreferenced file names") {
                
                it("returns no file names for non-existing folder") {
                    fileManager.contentsOfDirectory = [url1, url2]
                    let urls = invalidManager.getUnreferencedFileNames(forReferences: ["fo.o", "ba.r"])
                    expect(urls.count).to(equal(0))
                }
                
                it("returns no file names for no existing files") {
                    let urls = manager.getUnreferencedFileNames(forReferences: ["fo.o", "ba.r"])
                    expect(urls.count).to(equal(0))
                }
                
                it("returns single unreferenced file name") {
                    fileManager.contentsOfDirectory = [url1, url2]
                    let urls = manager.getUnreferencedFileNames(forReferences: ["fo.o"])
                    expect(urls.count).to(equal(1))
                    expect(urls.first).to(equal(url2.lastPathComponent))
                }
                
                it("returns many unreferenced file names") {
                    fileManager.contentsOfDirectory = [url1, url2]
                    let urls = manager.getUnreferencedFileNames(forReferences: ["baz"])
                    expect(urls.count).to(equal(2))
                    expect(urls.first).to(equal(url1.lastPathComponent))
                    expect(urls.last).to(equal(url2.lastPathComponent))
                }
                
                it("returns no file names if all names are included in reference list") {
                    fileManager.contentsOfDirectory = [url1, url2]
                    let urls = manager.getUnreferencedFileNames(forReferences: ["fo.o", "ba.r"])
                    expect(urls.count).to(equal(0))
                }
            }
            
            
            context("when removing file") {
                
                it("fails if file could not be removed") {
                    fileManager.contentsOfDirectory = [url1, url2]
                    let didCreate = manager.removeFile(named: "fo.o")
                    expect(didCreate).to(beFalse())
                }
                
                it("fails if file does not exist") {
                    let didCreate = manager.removeFile(named: "ba.r")
                    expect(didCreate).to(beFalse())
                }
                
                it("can remove existing file") {
                    fileManager.contentsOfDirectory = [url1, url2]
                    let didCreate = manager.removeFile(named: "ba.r")
                    expect(didCreate).to(beTrue())
                    expect(fileManager.removedFileUrl!).to(equal(url2))
                }
            }
        }
    }
}



fileprivate func isDocumentDirectoryUrl(_ url: URL) -> Bool {
    let simulatorPattern = "Library/Developer/CoreSimulator/Devices"
    let simulatorMatch = url.path.contains(simulatorPattern)
    let devicePattern = "/var/mobile/Containers"
    let deviceMatch = url.path.contains(devicePattern)
    return simulatorMatch || deviceMatch
}

fileprivate func isValidTestFileUrl(_ url: URL) -> Bool {
    return !url.absoluteString.contains("fo.o")
}



fileprivate class TestFileManager: AppFileManager {
    
    var attributes: [FileAttributeKey : Any]?
    var contentsOfDirectory = [URL]()
    var createdFileUrl: URL?
    var createdFileContent: Data?
    var fileSize: UInt64?
    var removedFileUrl: URL?
    
    func createFile(at url: URL, contents: Data?) -> Bool {
        guard isValidTestFileUrl(url) else { return false }
        createdFileUrl = url
        createdFileContent = contents
        return true
    }
    
    func getAttributesForFile(at url: URL) -> [FileAttributeKey : Any]? {
        return isValidTestFileUrl(url) ? attributes : nil
    }
    
    func getContentsOfDirectory(at url: URL) -> [URL] {
        return isDocumentDirectoryUrl(url) ? contentsOfDirectory : [URL]()
    }
    
    func getSizeOfFile(at url: URL) -> UInt64? { return fileSize }
    
    func removeFile(at url: URL) -> Bool {
        guard isValidTestFileUrl(url) else { return false }
        removedFileUrl = url
        return true
    }
    
    
    func fileExists(at url: URL) -> Bool { return false }
    
}
