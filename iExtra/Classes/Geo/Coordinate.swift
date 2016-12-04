//
//  Coordinates.swift
//  iExtra
//
//  Created by Daniel Saidi on 2015-10-04.
//  Copyright © 2015 Daniel Saidi. All rights reserved.
//

import CoreLocation

public enum Coordinate { case
    
    manhattan,
    newYork,
    sanFransisco,
    tokyo
    
    public var coordinate: CLLocationCoordinate2D {
        switch self {
        case .manhattan: return CLLocationCoordinate2D(latitude: 40.7590615, longitude: -73.969231)
        case .newYork: return CLLocationCoordinate2D(latitude: 40.7033127, longitude: -73.979681)
        case .sanFransisco: return CLLocationCoordinate2D(latitude: 37.7796828, longitude: -122.4000062)
        case .tokyo: return CLLocationCoordinate2D(latitude: 35.673, longitude: 139.710)
        }
    }
}
