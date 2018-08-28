//
//  MKAnnotation+DefaultView.swift
//  iExtra
//
//  Created by Daniel Saidi on 2017-09-09.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

import MapKit

public extension MKAnnotation {
    
    public func defaultView(in mapView: MKMapView) -> MKAnnotationView? {
        if let annotation = self as? MapAnnotation {
            return annotation.view(for: mapView)
        }
        return mapView.view(for: self)
    }
}
