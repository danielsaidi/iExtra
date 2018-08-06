//
//  MainBundleImageFileFinder.swift
//  iExtra
//
//  Created by Daniel Saidi on 2015-11-16.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

/*
 
 This class finds all non-asset images in the app bundle and
 removes any retina variations.
 
 */

import Foundation

public class MainBundleImageFileFinder: MainBundleFileFinder {
    
    public override func findFiles(withPrefix prefix: String) -> [String] {
        let rawResult = super.findFiles(withPrefix: prefix)
        let result = filter(rawResult)
        return result
    }
    
    public override func findFiles(withSuffix suffix: String) -> [String] {
        let rawResult = super.findFiles(withSuffix: suffix)
        let result = filter(rawResult)
        return result
    }
}


private extension MainBundleImageFileFinder {
    
    func filter(_ rawResult: [String]) -> [String] {
        return rawResult.flatMap { getBaseImageName($0) }
    }
    
    func getBaseImageName(_ fileName: String) -> String? {
        guard isBaseImageName(fileName) else { return nil }
        var result = fileName.components(separatedBy: ".").first
        result = result?.components(separatedBy: "~").first
        return result
    }
    
    func isBaseImageName(_ fileName: String) -> Bool {
        return !fileName.contains("@")
            && !fileName.contains("_2x")
            && !fileName.contains("_3x")
            && !fileName.contains("~")
    }
}
