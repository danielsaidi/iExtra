//
//  LinearTravellingMapCamera.swift
//  iExtra
//
//  Created by Daniel Saidi on 2015-10-04.
//  Copyright © 2015 Daniel Saidi. All rights reserved.
//

import MapKit
import CoreLocation

public class LinearTravellingMapCamera: MKMapCamera, TravellingMapCamera {
    
    
    // MARK: Initialization
    
    deinit {
        stopTravelling()
    }
    
    
    
    // MARK: Properties
    
    public var direction = CGPoint(x: 0.00001, y: 0.00001)
    public var updateInterval = 0.1
    
    weak private var mapView: MKMapView?
    
    public private(set) var isTravelling = false
    
    
    
    // MARK: Public functions

    public func startTravelling(in mapView: MKMapView) {
        guard !isTravelling else { return }
        isTravelling = true
        self.mapView = mapView
        travel(inDirection: direction)
    }
    
    public func stopTravelling() {
        isTravelling = false
    }
    
    
    
    // MARK: Private functions
    
    private func travel(inDirection vector: CGPoint) {
        if (!isTravelling || mapView == nil) {
            return
        }
        
        if let coord = mapView?.centerCoordinate {
            let x = coord.latitude + CLLocationDegrees(vector.x)
            let y = coord.longitude + CLLocationDegrees(vector.y)
            centerCoordinate = CLLocationCoordinate2D(latitude: x, longitude: y)
            mapView?.setCamera(self, animated: true)
            delay(updateInterval) {
                self.travel(inDirection: vector)
            }
        }
    }
}
