//
//  LocationServiceDefault.swift
//  iExtra
//
//  Created by Daniel Saidi on 2015-02-03.
//  Copyright (c) 2015 Daniel Saidi. All rights reserved.
//

import CoreLocation

open class LocationServiceDefault: NSObject, LocationService {
    

    // MARK: - Properties
    
    fileprivate var hasWarnedForMissingPermissions = false
    lazy fileprivate var locationManager = CLLocationManager()
    
    
    
    // MARK: Public methods
    
    open func getCurrentUserLocation() -> CLLocationCoordinate2D? {
        return locationManager.location?.coordinate
    }
    
    open func requestAlwaysAuthorization() {
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
    }
    
    open func requestWhenInUseAuthorization() {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
    }
}



// MARK: CLLocationManagerDelegate

extension LocationServiceDefault: CLLocationManagerDelegate {
    
    open func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        guard status != .notDetermined else { return }
        
        let enabled = status == .authorizedAlways || status == .authorizedWhenInUse
        if !enabled && !hasWarnedForMissingPermissions {
            hasWarnedForMissingPermissions = true
            LocationServiceErrorAlert.present()
        }
    }
}
