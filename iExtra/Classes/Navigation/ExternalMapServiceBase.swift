//
//  ExternalMapServiceBase.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-12-20.
//  Copyright (c) 2016 Daniel Saidi. All rights reserved.
//

import CoreLocation

open class ExternalMapServiceBase: NSObject, ExternalMapService {
    
    open func copyUrl(for coordinate: CLLocationCoordinate2D) -> Bool {
        guard let url = getUrl(for: coordinate) else { return false }
        UIPasteboard.general.string = url.absoluteString
        return true
    }
    
    open func getUrl(for coordinate: CLLocationCoordinate2D) -> URL? {
        return nil
    }
    
    open func getUrl(from: CLLocationCoordinate2D, to: CLLocationCoordinate2D) -> URL? {
        return nil
    }
    
    open func navigate(from: CLLocationCoordinate2D, to: CLLocationCoordinate2D) {
        guard let url = getUrl(from: from, to: to) else { return }
        UIApplication.shared.openURL(url)
    }
    
    open func show(coordinate: CLLocationCoordinate2D) {
        guard let url = getUrl(for: coordinate) else { return }
        UIApplication.shared.openURL(url)
    }
}
