//
//  AdaptiveFileSizePresenter.swift
//  iExtra
//
//  Created by Daniel Saidi on 2015-11-15.
//  Copyright © 2015 Daniel Saidi. All rights reserved.
//

import UIKit

public class AdaptiveFileSizePresenter: FileSizeBytesPresenter {
    
    
    // MARK: - Properties
    
    fileprivate var dimensionThreshold: Double = 1024/2
    
    
    
    // MARK: - Public Functions
    
    public override func fileSizeDescription(for fileSize: UInt64) -> String {
        var size = Double(fileSize)
        
        if isByteFileSize(size) {
            return super.fileSizeDescription(for: fileSize)
        }
        
        var labels = getSizeLabels()
        var label = labels.remove(at: 0)
        while size >= dimensionThreshold {
            guard labels.count > 0 else { break }
            size = getNextDimensionSize(for: size)
            label = labels.remove(at: 0)
        }
        
        let sizeText = size.format(withDecimals: 2)
        
        return "\(sizeText) \(label)"
    }
}


// MARK: - Private Functions

fileprivate extension AdaptiveFileSizePresenter {
    
    func getNextDimensionSize(for size: Double) -> Double {
        return size / 1024.0
    }
    
    func getSizeLabels() -> [String] {
        return ["bytes", "kB", "MB", "GB", "TB", "PB"]
    }
    
    func isByteFileSize(_ size: Double) -> Bool {
        return size < dimensionThreshold
    }
}
