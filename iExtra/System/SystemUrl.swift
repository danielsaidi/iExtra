//
//  SystemUrl.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-01-14.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import Foundation

public enum SystemUrl { case
    
    applicationSettings,
    appStoreApp(appId: String, appName: String),
    appStoreAppReview(appId: String, appName: String)
    
    
    public var url: URL? {
        return URL(string: urlString)
    }
    
    public var urlString: String {
        
        switch self {
            
        case .applicationSettings:
            return UIApplicationOpenSettingsURLString
            
        case .appStoreApp(let appId, let appName):
            return "https://itunes.apple.com/app/\(appName)/id\(appId)"
        
        case .appStoreAppReview(let appId, let appName):
            return "itms-apps://geo.itunes.apple.com/app/\(appName)/id\(appId)?mt=8&action=viewContentsUserReviews"
        }
    }
}
