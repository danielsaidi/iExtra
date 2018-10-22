//
//  WorldCoordinate.swift
//  iExtra
//
//  Created by Daniel Saidi on 2015-10-04.
//  Copyright © 2015 Daniel Saidi. All rights reserved.
//

import CoreLocation

public struct WorldCoordinate {
    
    public let coordinate: CLLocationCoordinate2D
}

public extension WorldCoordinate {
    
    static var manhattan: WorldCoordinate { return .init(coordinate: CLLocationCoordinate2D(latitude: 40.7590615, longitude: -73.969231)) }
    static var newYork: WorldCoordinate { return .init(coordinate: CLLocationCoordinate2D(latitude: 40.7033127, longitude: -73.979681)) }
    static var sanFransisco: WorldCoordinate { return .init(coordinate: CLLocationCoordinate2D(latitude: 37.7796828, longitude: -122.4000062)) }
    static var tokyo: WorldCoordinate { return .init(coordinate: CLLocationCoordinate2D(latitude: 35.673, longitude: 139.710)) }
}
