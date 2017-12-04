//
//  IapManagerDefault.swift
//  iExtra
//
//  Created by Daniel Saidi on 2015-01-27.
//  Copyright (c) 2015 Daniel Saidi. All rights reserved.
//

import Foundation
import StoreKit

open class IapManagerDefault: NSObject, IapManager, SKPaymentTransactionObserver, SKProductsRequestDelegate {
    
    
    // MARK: - Initialization
    
    public override init() {
        super.init()
        paymentQueue.add(self)
    }
    
    deinit {
        paymentQueue.remove(self)
    }
    
    
    // MARK: - Properties
    
    open weak var delegate: IapManagerDelegate?
    
    open var canMakePayments: Bool {
        return SKPaymentQueue.canMakePayments()
    }
    
    private var paymentQueue: SKPaymentQueue {
        return SKPaymentQueue.default()
    }
    
    
    // MARK: - Public functions
    
    open func complete(transaction: SKPaymentTransaction) {
        paymentQueue.finishTransaction(transaction)
    }
    
    open func purchase(product: SKProduct) {
        let payment = SKPayment(product: product)
        paymentQueue.add(payment)
    }
    
    open func requestProducts(withIds ids: [String]) {
        let request = SKProductsRequest(productIdentifiers: Set(ids))
        request.delegate = self
        request.start()
    }
    
    open func restorePurchases() {
        paymentQueue.restoreCompletedTransactions()
    }

    
    // MARK: - SKPaymentTransactionObserver
    
    open func paymentQueue(_ queue: SKPaymentQueue, restoreCompletedTransactionsFailedWithError error: Error) {
        delegate?.iapManagerDidFailToRestorePurchases(self)
    }
    
    open func paymentQueueRestoreCompletedTransactionsFinished(_ queue: SKPaymentQueue) {
        delegate?.iapManagerDidRestorePurchases(self)
    }
    
    open func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        delegate?.iapManager(self, didUpdateTransactions: transactions)
    }
    
    
    // MARK: - SKProductsRequestDelegate
    
    open func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        delegate?.iapManager(self, didReceiveProductsResponse: response)
    }
}
