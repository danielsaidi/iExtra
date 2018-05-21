//
//  InstantLanguageService.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-03-06.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

/*
 
 For this to work, your supported Localizable.strings
 must have a key with the locale's name as translated
 value. This will hopefully not be required later on.
 Specify this key's name when creating an instance of
 this class.
 
 */

import Foundation

open class InstantLanguageService: NSObject, LanguageService {
    
    
    // MARK: Initialization
    
    public init(localeTranslationKey: String) {
        self.localeTranslationKey = localeTranslationKey
        super.init()
    }
    
    
    // MARK: Properties
    
    open weak var delegate: LanguageServiceDelegate?
    
    open var currentLocale: String {
        return translate(localeTranslationKey)
    }
    
    fileprivate var bundle: Bundle?
    
    fileprivate let localeTranslationKey: String
    
    fileprivate var notificationCenter: NotificationCenter {
        return NotificationCenter.default
    }
    
    fileprivate var settings: UserDefaults {
        return UserDefaults.standard
    }
    
    
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
        guard loadBundle(for: locale) else { return }
        settings.set([locale], forKey: "AppleLanguages")
        settings.synchronize()
        delegate?.languageService(self, didSetLocale: locale)
        let notification = LanguageNotifications.languageChanged
        let notificationName = Notification.Name(rawValue: notification)
        notificationCenter.post(name: notificationName, object: nil)
    }
}


// MARK: - Private Functions

fileprivate extension InstantLanguageService {
    
    fileprivate func loadBundle(for locale: String) -> Bool {
        if let path = Bundle.main.path(forResource: locale, ofType: "lproj") {
            bundle = Bundle(path: path)
            return true
        }
        return false
    }
}
