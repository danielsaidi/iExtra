//
//  MKAnnotation+DefaultView.swift
//  iExtra
//
//  Created by Daniel Saidi on 2017-09-09.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

import MapKit

public extension MKAnnotation {
    
    func defaultView(in mapView: MKMapView) -> MKAnnotationView? {
        guard let annotation = self as? MapAnnotation else { return mapView.view(for: self) }
        return annotation.view(for: mapView)
    }
}
