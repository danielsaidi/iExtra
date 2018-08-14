//
//  MKMapView+ClosestAnnotation.swift
//  iExtra
//
//  Created by Daniel Saidi on 2018-08-14.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

import MapKit
import CoreLocation

public extension MKMapView {
    
    public var closestAnnotation: MKAnnotation? {
        guard let userLoc = userLocation.location else { return nil }
        let initial: (CLLocationDistance, MKAnnotation?) = (CLLocationDistanceMax, nil)
        return annotations.reduce(initial) { (nearest, annotation) in
            let coord = annotation.coordinate
            let annotationLoc = CLLocation(latitude: coord.latitude, longitude: coord.longitude)
            let distance = userLoc.distance(from: annotationLoc)
            return distance < nearest.0 ? (distance, annotation) : nearest
            }.1
    }
}
