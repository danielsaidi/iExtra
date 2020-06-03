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
}


// MARK: - Private Functions

private extension LinearTravellingMapCamera {
    
    func delay(seconds: TimeInterval, function: @escaping ()->()) {
        let milliseconds = Int(seconds * 1000)
        let interval: DispatchTimeInterval = .milliseconds(milliseconds)
        DispatchQueue.main.asyncAfter(deadline: .now() + interval, execute: function)
    }
    
    func travel(inDirection vector: CGPoint) {
        guard let mapView = mapView else { return }
        guard !isTravelling else { return }
        
        let center = mapView.centerCoordinate
        let x = center.latitude + CLLocationDegrees(vector.x)
        let y = center.longitude + CLLocationDegrees(vector.y)
        centerCoordinate = CLLocationCoordinate2D(latitude: x, longitude: y)
        mapView.setCamera(self, animated: true)
        
        delay(seconds: 0.1) {
            self.travel(inDirection: vector)
        }
    }
}
