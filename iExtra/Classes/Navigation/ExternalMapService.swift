//
//  ExternalMapService.swift
//  iExtra
//
//  Created by Daniel Saidi on 2015-02-18.
//  Copyright © 2015 Daniel Saidi. All rights reserved.
//

import CoreLocation

public protocol ExternalMapService {
    
    func copyUrl(for coordinate: CLLocationCoordinate2D) -> Bool
    func getUrl(for coordinate: CLLocationCoordinate2D) -> URL?
    func getUrl(from: CLLocationCoordinate2D, to: CLLocationCoordinate2D) -> URL?
    func navigate(from: CLLocationCoordinate2D, to: CLLocationCoordinate2D)
    func show(coordinate: CLLocationCoordinate2D)
}
