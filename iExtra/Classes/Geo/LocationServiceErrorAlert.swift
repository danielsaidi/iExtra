//
//  LocationServiceErrorAlert.swift
//  iExtra
//
//  Created by Daniel Saidi on 2015-09-23.
//  Copyright © 2015 Daniel Saidi. All rights reserved.
//

import iExtra

public final class LocationServiceErrorAlert {
    
    
    // MARK: Localizable properties
    
    public static var cancelButtonText = "Cancel"
    public static var message = "To use this app, we recommend that you enable location services."
    public static var settingsButtonText = "Open Settings"
    public static var title = "Location services disabled"
    
    
    
    // MARK: Public functions
    
    public static func present() {
        let title = LocationServiceErrorAlert.title
        let msg = LocationServiceErrorAlert.message
        let cancel = LocationServiceErrorAlert.cancelButtonText
        let settings = LocationServiceErrorAlert.settingsButtonText
        
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(
            title: cancel, style: .cancel) { (action) in })
        
        alert.addAction(UIAlertAction(
            title: settings, style: .default) { (action) in
                self.openSettings()
            })
        
        UIAlertControllerPresenter.show(alert, animated: true)
    }
    
    
    
    // MARK: - Private functions
    
    private static func openSettings() {
        let url = URL(string: UIApplicationOpenSettingsURLString)!
        UIApplication.shared.openURL(url)
    }
}
