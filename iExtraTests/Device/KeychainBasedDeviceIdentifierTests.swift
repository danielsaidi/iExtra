//
//  KeychainBasedDeviceIdentifierTests.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-11-24.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import iExtra


private class FakeKeychainService: KeychainServiceTestClass {
    
    var value: String?
    
    var setValue: String?
    var setAccessibility: KeychainItemAccessibility?
    
    override func string(for key: String, with accessibility: KeychainItemAccessibility?) -> String? {
        return value
    }
    
    override func set(_ value: String, for key: String, with accessibility: KeychainItemAccessibility?) -> Bool {
        setValue = value
        return true
    }
}


class KeychainBasedDeviceIdentifierTests: QuickSpec {
    
    override func spec() {
        
        describe("keychain device identifier") {
            
            let idKey = "device-uuid"
            let deviceName = "foo"
            
            var service: FakeKeychainService!
            var identifier: KeychainBasedDeviceIdentifier!
            
            beforeEach {
                service = FakeKeychainService()
                identifier = KeychainBasedDeviceIdentifier(keychainService: service, deviceName: deviceName)
                UserDefaults.standard.set(nil, forKey: idKey)
            }
            
            
            context("when keychain value exists") {
                it("returns keychain value") {
                    let id = "foo"
                    service.value = id
                    let result = identifier.getDeviceIdentifier()
                    expect(result).to(equal(id))
                }
            }
            
            context("when user defaults value exists") {
                it("returns user defaults value") {
                    let id = "user default id"
                    UserDefaults.standard.set(id, forKey: idKey)
                    let result = identifier.getDeviceIdentifier()
                    expect(result).to(equal(id))
                }
            }
            
            context("when no persisted value exists") {
                
                it("generates new id") {
                    let result = identifier.getDeviceIdentifier()
                    expect(result.count).to(equal(37 + deviceName.count))
                    expect(result.contains(" ")).to(beTrue())
                    expect(result.hasPrefix(" ")).to(beFalse())
                    expect(result.hasSuffix("foo")).to(beTrue())
                }

                // TODO: Find out why this crashes every second time
//                it("writes to keychain") {
//                    let _ = identifier.getDeviceIdentifier()
//                    expect(service.setValue!.count).to(equal(37 + deviceName.count))
//                    expect(service.setAccessibility).to(beNil())
//                }
                
                it("writes to user defaults") {
                    let _ = identifier.getDeviceIdentifier()
                    let defaults = UserDefaults.standard
                    let id = defaults.string(forKey: idKey)
                    expect(id!.count).to(equal(37 + deviceName.count))
                }
            }
        }
    }
}
