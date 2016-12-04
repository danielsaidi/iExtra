//
//  LocationService.swift
//  iExtra
//
//  Created by Daniel Saidi on 2015-02-03.
//  Copyright (c) 2015 Daniel Saidi. All rights reserved.
//

import Foundation
import CoreLocation

public protocol LocationService {
    
    func getCurrentUserLocation() -> CLLocationCoordinate2D?
    func requestAlwaysAuthorization()
    func requestWhenInUseAuthorization()
}
