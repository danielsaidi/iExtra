//
//  FileSizeBytesPresenter.swift
//  iExtra
//
//  Created by Daniel Saidi on 2015-11-15.
//  Copyright © 2015 Daniel Saidi. All rights reserved.
//

import UIKit

public class FileSizeBytesPresenter: NSObject, FileSizePresenter {
    
    public func fileSizeDescription(for fileSize: UInt64) -> String {
        guard fileSize != 1 else { return "1 byte" }
        return "\(fileSize) bytes"
    }
}
