//
//  MKMapType_Int.swift
//  iExtra
//
//  Created by Daniel Saidi on 2015-09-23.
//  Copyright © 2015 Daniel Saidi. All rights reserved.
//

/* TODO: Replace with raw value */

import MapKit

public extension MKMapType {
    
    public var intValue: Int {
        if (self == .satellite) { return 1 }
        if (self == .hybrid) { return 2 }
        return 0
    }
    
    public static func fromInt(_ value: Int) -> MKMapType {
        if (value == 1) { return .satellite }
        if (value == 2) { return .hybrid }
        return .standard
    }
}
