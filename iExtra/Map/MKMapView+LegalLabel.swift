//
//  MKMapView+LegalLabel.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-10-12.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import MapKit

public extension MKMapView {

    public func hideLegalLabel() {
        subviews[1].isHidden = true
    }
}
