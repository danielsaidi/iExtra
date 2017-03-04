//
//  BiometricsAuthorizationService.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-01-18.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import UIKit
import LocalAuthentication

public class BiometricsAuthorizationService: NSObject, AuthorizationService {
    
    
    // MARK: Properties
    
    fileprivate var policy = LAPolicy.deviceOwnerAuthenticationWithBiometrics
    
    fileprivate static var cache = [String : Bool]()
    
    
    // MARK: Public functions
    
    public func authorize(action: String, reason: String, completion: @escaping AuthorizationResult) {
        guard canAuthorize(action: action) else { return completion(false) }
        guard !isAuthorized(forAction: action) else { return completion(true) }
        
        LAContext().evaluatePolicy(policy, localizedReason: reason, reply: { (success, error) in
            self.setIsAuthorized(success, forAction: action)
            DispatchQueue.main.async(execute: { completion(success) })
        })
    }
    
    public func canAuthorize(action: String) -> Bool {
        var error: NSError?
        return (LAContext().canEvaluatePolicy(policy, error: &error))
    }
    
    public func isAuthorized(forAction action: String) -> Bool {
        let key = authKey(forAction: action)
        return BiometricsAuthorizationService.cache[key] ?? false
    }
    
    public func resetAuthorization(forAction action: String) {
        setIsAuthorized(false, forAction: action)
    }
}


// MARK: Private functions

fileprivate extension BiometricsAuthorizationService {
    
    func authKey(forAction action: String) -> String {
        return "authorization_action_\(action)"
    }
    
    func setIsAuthorized(_ authorized: Bool, forAction action: String) {
        let key = authKey(forAction: action)
        BiometricsAuthorizationService.cache[key] = authorized
    }
}
