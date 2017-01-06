//
//  ExternalMapServicePicker.swift
//  iExtra
//
//  Created by Daniel Saidi on 2015-02-18.
//  Copyright (c) 2015 Daniel Saidi. All rights reserved.
//

import UIKit

public final class ExternalMapServicePicker: NSObject {
    
    
    // MARK: Localizable properties
    
    public static var appleButtonTitle = "Apple Maps"
    public static var cancelButtonTitle = "Cancel"
    public static var googleButtonTitle = "Google Maps"
    public static var title = "Which app would you like to use?"
    public static var message: String? = nil
    
    
    
    // MARK: Public functions
    
    public static func present(in vc: UIViewController, from: UIView?, completion: @escaping ((_ service: ExternalMapService?) -> Void)) {
        
        let title = ExternalMapServicePicker.title
        let message = ExternalMapServicePicker.message
        let style: UIAlertControllerStyle = from == nil ? .alert : .actionSheet
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        alert.sourceView = from
        
        let appleTitle = ExternalMapServicePicker.appleButtonTitle
        let appleAction = UIAlertAction(title: appleTitle, style: .default) { action in
            completion(AppleMapsService())
        }
        alert.addAction(appleAction)
        
        let googleTitle = ExternalMapServicePicker.googleButtonTitle
        let googleAction = UIAlertAction(title: googleTitle, style: .default) { action in
            completion(GoogleMapsService())
        }
        alert.addAction(googleAction)
        
        let cancelTitle = ExternalMapServicePicker.cancelButtonTitle
        let cancelAction = UIAlertAction(title: cancelTitle, style: .cancel) { action in
            completion(nil)
        }
        alert.addAction(cancelAction)
        
        vc.present(alert, animated: true)
    }
}
