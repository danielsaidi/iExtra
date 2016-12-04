//
//  TravellingMapViewCamera.swift
//  iExtra
//
//  Created by Daniel Saidi on 2015-10-04.
//  Copyright © 2015 Daniel Saidi. All rights reserved.
//

import MapKit

public protocol TravellingMapCamera {
    
    var isTravelling: Bool { get }
    
    func startTravelling(in mapView: MKMapView)
    func stopTravelling()
}
