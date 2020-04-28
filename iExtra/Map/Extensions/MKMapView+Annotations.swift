//
//  MKMapView+Annotations.swift
//  iExtra
//
//  Created by Daniel Saidi on 2015-09-17.
//  Copyright © 2015 Daniel Saidi. All rights reserved.
//

import MapKit

public extension MKMapView {
    
    func getAnnotations<T: MKAnnotation>(ofType type: T.Type) -> [T] {
        annotations.compactMap { $0 as? T }
    }
    
    func removeAllAnnotations() {
        removeAnnotations(annotations)
    }
    
    func removeAnnotations<T: MKAnnotation>(ofType type: T.Type) {
        removeAnnotations(getAnnotations(ofType: type))
    }
}
