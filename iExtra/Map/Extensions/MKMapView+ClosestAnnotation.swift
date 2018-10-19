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
    
    var closestAnnotation: MKAnnotation? {
        guard let userLoc = userLocation.location else { return nil }
        let initial: (distance: CLLocationDistance, annotation: MKAnnotation?) = (CLLocationDistanceMax, nil)
        return annotations.reduce(initial) { (closest, annotation) in
            if annotation is MKUserLocation { return closest }
            let coord = annotation.coordinate
            let annotationLoc = CLLocation(latitude: coord.latitude, longitude: coord.longitude)
            let distance = userLoc.distance(from: annotationLoc)
            return distance < closest.distance ? (distance, annotation) : closest
        }.annotation
    }
}
