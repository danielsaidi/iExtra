//
//  MKAnnotation+DefaultView.swift
//  iExtra
//
//  Created by Daniel Saidi on 2017-09-09.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import MapKit
import iExtra

class MKAnnotationDefaultViewTests: QuickSpec {
    
    override func spec() {
        
        describe("default view") {
            let annotation = TestAnnotation()
            annotation.coordinate = CLLocationCoordinate2D(latitude: 0, longitude: 0)
            let view = annotation.defaultView(in: MKMapView())
            expect(view?.backgroundColor?.hexString).to(equal("#FF0000"))
        }
    }
}


private class TestAnnotation: MapAnnotation {
    
    override func view(for mapView: MKMapView) -> MKAnnotationView? {
        let view = MKAnnotationView(annotation: self, reuseIdentifier: "")
        view.backgroundColor = .red
        return view
    }
}
