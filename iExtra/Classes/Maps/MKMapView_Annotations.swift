//
//  MKMapView_Annotations.swift
//  iExtra
//
//  Created by Daniel Saidi on 2015-09-17.
//  Copyright © 2015 Daniel Saidi. All rights reserved.
//

import MapKit

public extension MKMapView {
    
    public func getAnnotations<T>(ofType type: T.Type) -> [T] {
        return annotations.filter({ $0 is T }).map({ $0 as! T })
    }
    
    public func removeAllAnnotations() {
        removeAnnotations(annotations)
    }
    
    public func removeAnnotations<T: MKAnnotation>(ofType type: T.Type) {
        removeAnnotations(getAnnotations(ofType: type))
    }
}
