//
//  InstantLanguageService.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-03-06.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

/*
 
 This service lets you switch languages immediately, without
 having to restart your app. For this to work, your language
 files must have a translation with the same key name as the
 `localeTranslationKey` property, and the locale name as the
 translated value, e.g. `"locale" = "en";`
 
 When you want to set a locale, either with a string or with
 a locale instance, the locale string or locale's instance's
 language code must match the name of the language's folder.
 When you then call `currentLocale`, it will translate it to
 the translation in the language file.
 
 */

import Foundation

open class InstantLanguageService: LanguageService {
    
    
    // MARK: Initialization
    
    public init(localeTranslationKey: String) {
        self.localeTranslationKey = localeTranslationKey
    }
    
    
    // MARK: Properties
    
    public weak var delegate: LanguageServiceDelegate?
    
    open var currentLocale: String {
        return translate(localeTranslationKey)
    }
    
    private var bundle: Bundle?
    
    private let localeTranslationKey: String
    
    
    // MARK: - Translator
    
    open func canTranslate(_ key: String) -> Bool {
        return translate(key) != key
    }

    open func translate(_ key: String) -> String {
        let standard = NSLocalizedString(key, comment: "")
        guard let bundle = bundle else { return standard }
        return bundle.localizedString(forKey: key, value: "", table: nil)
    }
    
    
    // MARK: LanguageService
    
    open func setLocale(_ locale: String) {
        let defaults = UserDefaults.standard
        guard loadBundle(for: locale) else { return }
        defaults.set([locale], forKey: "AppleLanguages")
        defaults.synchronize()
        NotificationCenter.default.post(name: .languageChanged, object: nil)
    }
    
    open func setLocale(_ locale: Locale) {
        guard let code = locale.languageCode else { return }
        setLocale(code)
    }
}


// MARK: - Private Functions

private extension InstantLanguageService {
    
    func loadBundle(for locale: String) -> Bool {
        guard let path = Bundle.main.path(forResource: locale, ofType: "lproj") else { return false }
        bundle = Bundle(path: path)
        return true
    }
}
