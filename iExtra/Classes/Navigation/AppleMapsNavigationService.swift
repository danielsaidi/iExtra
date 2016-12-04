//
//  AppleMapsNavigationService.swift
//  iExtra
//
//  Created by Daniel Saidi on 2015-02-18.
//  Copyright (c) 2015 Daniel Saidi. All rights reserved.
//

import CoreLocation

public class AppleMapsNavigationService: NSObject, NavigationService {
    
    public func navigate(from: CLLocationCoordinate2D, to: CLLocationCoordinate2D) {
        let url = "http://maps.apple.com/maps?saddr=\(from.latitude),\(from.longitude)&daddr=\(to.latitude),\(to.longitude)"
        UIApplication.shared.openURL(URL(string:url)!)
    }
}
