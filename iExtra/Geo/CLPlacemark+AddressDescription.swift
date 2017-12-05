//
//  CLPlacemark+AddressDescription.swift
//  iExtra
//
//  Created by Daniel Saidi on 2015-02-22.
//  Copyright © 2015 Daniel Saidi. All rights reserved.
//

import CoreLocation

public extension CLPlacemark {
    
    public var addressDescription: String {
        guard let dictionary = addressDictionary else { return "" }
        guard let lines = dictionary["FormattedAddressLines"] else { return "" }
        guard let list = lines as? [String] else { return "" }
        return list.joined(separator: ", ")
    }
}
