//
//  CLLocationCoordinate2D+ValidTests.swift
//  iExtraTests
//
//  Created by Daniel Saidi on 2018-10-19.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import iExtra
import CoreLocation

class CLLocationCoordinate2D_ValidTests: QuickSpec {
    
    override func spec() {
        
        describe("Coordinate validation") {
            
            func validate(_ lat: CLLocationDegrees, _ long: CLLocationDegrees) -> Bool {
                return CLLocationCoordinate2D(latitude: lat, longitude: long).isValid
            }
            
            it("is invalid if latitude is invalid") {
                expect(validate(0, 120)).to(beFalse())
                expect(validate(180, 120)).to(beFalse())
                expect(validate(-180, 120)).to(beFalse())
            }
            
            it("is invalid if longitude is invalid") {
                expect(validate(120, 0)).to(beFalse())
                expect(validate(120, 180)).to(beFalse())
                expect(validate(120, -180)).to(beFalse())
            }
            
            it("is valid if both components are valid") {
                expect(validate(120, 120)).to(beTrue())
            }
        }
    }
}
