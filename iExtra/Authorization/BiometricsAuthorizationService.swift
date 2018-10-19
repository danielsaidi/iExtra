//
//  BiometricsAuthorizationService.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-01-18.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

import UIKit
import LocalAuthentication

public class BiometricsAuthorizationService: AuthorizationService {
    
    
    // MARK: - Initialization
    
    public init() {}
    
    
    // MARK: Properties
    
    private var policy = LAPolicy.deviceOwnerAuthenticationWithBiometrics
    
    private static var cache = [String: Bool]()
    
    
    // MARK: Public functions
    
    public func authorize(action: String, reason: String, completion: @escaping AuthorizationResult) {
        guard canAuthorize(action: action) else { return completion(false) }
        guard !isAuthorized(for: action) else { return completion(true) }
        
        LAContext().evaluatePolicy(policy, localizedReason: reason) { (success, _) in
            self.setIsAuthorized(success, forAction: action)
            DispatchQueue.main.async(execute: { completion(success) })
        }
    }
    
    public func canAuthorize(action: String) -> Bool {
        var error: NSError?
        return (LAContext().canEvaluatePolicy(policy, error: &error))
    }
    
    public func isAuthorized(for action: String) -> Bool {
        let key = authKey(forAction: action)
        return BiometricsAuthorizationService.cache[key] ?? false
    }
    
    public func resetAuthorization(for action: String) {
        setIsAuthorized(false, forAction: action)
    }
}


private extension BiometricsAuthorizationService {
    
    func authKey(forAction action: String) -> String {
        return "com.danielsaidi.iExtra.\(action)"
    }
    
    func setIsAuthorized(_ authorized: Bool, forAction action: String) {
        let key = authKey(forAction: action)
        BiometricsAuthorizationService.cache[key] = authorized
    }
}
