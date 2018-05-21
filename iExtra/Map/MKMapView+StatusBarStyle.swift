//
//  MKMapView+StatusBarStyle.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-10-05.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

import UIKit
import MapKit

public extension MKMapView {
    
    public var statusBarStyle: UIStatusBarStyle {
        switch mapType {
        case .standard: return .default
        default: return .lightContent
        }
    }
    
    public var navigationBarStyle: UIBarStyle {
        switch mapType {
        case .standard: return .default
        default: return .blackTranslucent
        }
    }
}
