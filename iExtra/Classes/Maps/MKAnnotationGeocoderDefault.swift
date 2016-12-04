//
//  MKAnnotationGeocoderDefault.swift
//  iExtra
//
//  Created by Daniel Saidi on 2015-02-01.
//  Copyright (c) 2015 Daniel Saidi. All rights reserved.
//

import CoreLocation
import MapKit

public class MKAnnotationGeocoderDefault: NSObject, MKAnnotationGeocoder {
    
    public func reverseGeocode(_ annotation: MKAnnotation, completion: @escaping ((_ placemark: CLPlacemark?) -> ())) {
        let coord = annotation.coordinate
        let location = CLLocation(latitude: coord.latitude, longitude: coord.longitude)
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location) { (placemarks, error) in
            completion(placemarks?.first)
        }
    }
    
    public func reverseGeocodeAddressSubtitle(for annotation: MKAnnotation) {
        reverseGeocode(annotation) { placemark in
            guard let placemark = placemark else { return }
            if let userAnnotation = annotation as? MKUserLocation {
                userAnnotation.willChangeValue(forKey: "subtitle")
                userAnnotation.subtitle = placemark.addressDescription
                userAnnotation.didChangeValue(forKey: "subtitle")
            } else if let mapAnnotation = annotation as? MapAnnotation {
                mapAnnotation.subtitle = placemark.addressDescription
            }
        }
    }
}
