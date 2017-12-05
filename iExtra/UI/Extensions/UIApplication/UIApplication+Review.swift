//
//  UIApplication+Review.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-01-08.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import UIKit

public extension UIApplication {
    
    public static func leaveReview(for appId: String) {
        let urlString = "itms-apps://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?id=\(appId)&onlyLatestVersion=true&pageNumber=0&sortOrdering=1&type=Purple+Software"
        if let url = URL(string: urlString) {
            shared.openURL(url)
        }
    }
}
