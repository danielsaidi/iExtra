//
//  NavigationServiceAlert.swift
//  iExtra
//
//  Created by Daniel Saidi on 2015-02-18.
//  Copyright (c) 2015 Daniel Saidi. All rights reserved.
//

import UIKit

public final class NavigationServiceAlert: NSObject {
    
    
    // MARK: Localizable properties
    
    static var appleButtonTitle = "Apple Maps"
    static var cancelButtonTitle = "Cancel"
    static var googleButtonTitle = "Google Maps"
    static var title = "Which app would you like to use?"
    
    
    
    // MARK: Public functions
    
    public static func present(in vc: UIViewController, completion: @escaping ((_ service: NavigationService?) -> Void)) {
        
        let title = NavigationServiceAlert.title
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        
        let appleTitle = NavigationServiceAlert.appleButtonTitle
        let appleAction = UIAlertAction(title: appleTitle, style: .default) { action in
            completion(AppleMapsNavigationService())
        }
        alert.addAction(appleAction)
        
        let googleTitle = NavigationServiceAlert.googleButtonTitle
        let googleAction = UIAlertAction(title: googleTitle, style: .default) { action in
            completion(GoogleMapsNavigationService())
        }
        alert.addAction(googleAction)
        
        let cancelTitle = NavigationServiceAlert.cancelButtonTitle
        let cancelAction = UIAlertAction(title: cancelTitle, style: .cancel) { action in
            completion(nil)
        }
        alert.addAction(cancelAction)
        
        vc.present(alert, animated: true)
    }
}
