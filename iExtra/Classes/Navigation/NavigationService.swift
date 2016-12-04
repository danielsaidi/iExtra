//
//  NavigationService.swift
//  iExtra
//
//  Created by Daniel Saidi on 2015-02-18.
//  Copyright (c) 2015 Daniel Saidi. All rights reserved.
//

import CoreLocation

public protocol NavigationService {
    
    func navigate(from: CLLocationCoordinate2D, to: CLLocationCoordinate2D)
}
