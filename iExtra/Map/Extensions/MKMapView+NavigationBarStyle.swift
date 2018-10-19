//
//  MKMapView+NavigationBarStyle.swift
//  iExtra
//
//  Created by Daniel Saidi on 2018-10-19.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

import UIKit
import MapKit

public extension MKMapView {
    
    var navigationBarStyle: UIBarStyle {
        switch mapType {
        case .standard: return .default
        default: return .blackTranslucent
        }
    }
}
