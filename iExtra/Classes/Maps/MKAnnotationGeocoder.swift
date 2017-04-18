//
//  MKAnnotationGeocoder.swift
//  iExtra
//
//  Created by Daniel Saidi on 2015-02-01.
//  Copyright (c) 2015 Daniel Saidi. All rights reserved.
//

import CoreLocation
import MapKit

public typealias ReverseGeocodeResult = (_ placemark: CLPlacemark?, _ error: Error?) -> ()

public protocol MKAnnotationGeocoder {
    
    func reverseGeocode(_ annotation: MKAnnotation, completion: @escaping ReverseGeocodeResult)
    
    func reverseGeocodeAddressSubtitle(for annotation:MKAnnotation)
}
