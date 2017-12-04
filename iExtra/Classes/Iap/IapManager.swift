//
//  IapManager.swift
//  iExtra
//
//  Created by Daniel Saidi on 2015-01-27.
//  Copyright © 2015 Daniel Saidi. All rights reserved.
//

import Foundation
import StoreKit


public protocol IapManagerDelegate: class {
    
    func iapManager(_ manager: IapManager, didReceiveProductsResponse info: SKProductsResponse)
    func iapManager(_ manager: IapManager, didUpdateTransactions transactions: [SKPaymentTransaction])
    func iapManagerDidRestorePurchases(_ manager: IapManager)
    func iapManagerDidFailToRestorePurchases(_ manager: IapManager)
}


public protocol IapManager: class {
    
    
    // MARK: - Properties
    
    weak var delegate: IapManagerDelegate? { get set }
    
    var canMakePayments: Bool { get }

    
    // MARK: - Functions
    
    func complete(transaction: SKPaymentTransaction)
    func purchase(product: SKProduct)
    func requestProducts(withIds ids: [String])
    func restorePurchases()
}
