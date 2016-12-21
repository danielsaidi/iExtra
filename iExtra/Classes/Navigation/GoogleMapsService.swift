//
//  GoogleMapsService.swift
//  iExtra
//
//  Created by Daniel Saidi on 2015-02-18.
//  Copyright (c) 2015 Daniel Saidi. All rights reserved.
//

import CoreLocation

open class GoogleMapsService: ExternalMapServiceBase {
    
    open override func getUrl(for coordinate: CLLocationCoordinate2D) -> URL? {
        let string = "http://maps.google.com/maps?saddr=\(coordinate.latitude),\(coordinate.longitude)"
        return URL(string: string)
    }
    
    open override func getUrl(from: CLLocationCoordinate2D, to: CLLocationCoordinate2D) -> URL? {
        guard let baseUrl = getUrl(for: from) else { return nil }
        let string = "\(baseUrl.absoluteString)&daddr=\(to.latitude),\(to.longitude)"
        return URL(string: string)
    }
}
