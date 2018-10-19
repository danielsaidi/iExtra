//
//  CLLocationCoordinate2D+Valid.swift
//  iExtra
//
//  Created by Daniel Saidi on 2015-09-18.
//  Copyright © 2015 Daniel Saidi. All rights reserved.
//

import CoreLocation

public extension CLLocationCoordinate2D {
    
    
    // MARK: - Properties
    
    var isValid: Bool {
        return isValidDegrees(latitude) && isValidDegrees(longitude)
    }
    
    
    // MARK: - Private functions
    
    private func isValidDegrees(_ degrees: CLLocationDegrees) -> Bool {
        return degrees != 0 && degrees != 180 && degrees != -180
    }
}
