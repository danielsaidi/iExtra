//
//  CsvParser.swift
//  iExtra
//
//  Created by Daniel Saidi on 2018-10-23.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

import Foundation

public protocol CsvParser {
    
    func parseCvsString(_ string: String, separator: Character) -> [[String]]
    func parseCvsFile(named fileName: String, withExtension ext: String, in bundle: Bundle, separator: Character) throws -> [[String]]
}
