//
//  LanguageService.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-03-06.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

import Foundation


public protocol LanguageServiceDelegate: class {
    
    func languageService(_ service: LanguageService, didSetLocale locale: String)
}


public protocol LanguageService: class, Translator {
    
    var delegate: LanguageServiceDelegate? { get set }
    
    var currentLocale: String { get }
    
    func setLocale(_ locale: String)
}
