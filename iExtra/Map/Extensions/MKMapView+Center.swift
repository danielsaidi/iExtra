//
//  MKMapView+CenterCoordinate.swift
//  iExtra
//
//  Created by Daniel Saidi on 2015-09-18.
//  Copyright © 2015 Daniel Saidi. All rights reserved.
//

import MapKit

public extension MKMapView {
    
    func center(on annotations: [MKAnnotation], padding: CGFloat, animated: Bool) {
        let coordinates = annotations.map { $0.coordinate }
        center(on: coordinates, padding: padding, animated: animated)
    }
    
    func center(on coordinate: CLLocationCoordinate2D, animated: Bool) {
        center(on: coordinate, heading: 0.0, animated: animated)
    }
    
    func center(on coordinate: CLLocationCoordinate2D, heading: Double, animated: Bool) {
        guard let newCamera = camera.copy() as? MKMapCamera else { return }
        newCamera.centerCoordinate = coordinate
        newCamera.heading = heading
        setCamera(newCamera, animated: animated)
    }
    
    func center(on coordinates: [CLLocationCoordinate2D], padding: CGFloat, animated: Bool) {
        guard coordinates.count > 0 else { return }
        var rect = MKMapRect.null
        let points = coordinates.map { MKMapPoint.init($0) }
        let rects = points.map { MKMapRect.init(x: $0.x, y: $0.y, width: 0.1, height: 0.1) }
        rects.forEach { rect = rect.union($0) }
        let insets = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        setVisibleMapRect(rect, edgePadding: insets, animated: animated)
    }
    
    func centerOnUserLocation(animated: Bool) {
        let coordinate = userLocation.coordinate
        if coordinate.isValid {
            center(on: coordinate, animated: animated)
        }
    }
}
