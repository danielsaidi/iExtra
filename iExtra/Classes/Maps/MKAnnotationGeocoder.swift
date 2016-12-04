//
//  MKAnnotationGeocoder.swift
//  iExtra
//
//  Created by Daniel Saidi on 2015-02-01.
//  Copyright (c) 2015 Daniel Saidi. All rights reserved.
//

import CoreLocation
import MapKit

public protocol MKAnnotationGeocoder {
    
    func reverseGeocode(_ annotation: MKAnnotation, completion: @escaping ((_ placemark: CLPlacemark?)->()))
    
    func reverseGeocodeAddressSubtitle(for annotation:MKAnnotation)
}
