//
//  MapAnnotation.swift
//  iExtra
//
//  Created by Daniel Saidi on 2014-12-19.
//  Copyright © 2014 Daniel Saidi. All rights reserved.
//

import CoreLocation
import MapKit
import UIKit

open class MapAnnotation: NSObject, MKAnnotation {
    
    
    // MARK: - Initialization
    
    public override init() {}
    
    public init(title: String, subtitle: String? = nil, coordinate: CLLocationCoordinate2D) {
        super.init()
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
        coordinateRegion.center = coordinate
    }
    
    
    // MARK: Properties
    
    public var title: String? {
        willSet { willChangeValue(forKey: "title") }
        didSet { didChangeValue(forKey: "title") }
    }
    
    public var subtitle: String? {
        willSet { willChangeValue(forKey: "subtitle") }
        didSet { didChangeValue(forKey: "subtitle") }
    }
    
    public var coordinate: CLLocationCoordinate2D {
        get { return coordinateRegion.center }
        set { coordinateRegion.center = newValue }
    }
    
    public var coordinateRegion = MKCoordinateRegion()
    
    
    // MARK: Functions
    
    open func view(for mapView: MKMapView) -> MKAnnotationView? {
        return nil
    }
}
