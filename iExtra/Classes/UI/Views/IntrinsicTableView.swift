//
//  IntrinsicTableView.swift
//  iExtra
//
//  Created by Daniel Saidi on 2017-10-31.
//

import UIKit

class IntrinsicTableView: UITableView {
    
    override var contentSize:CGSize {
        didSet {
            self.invalidateIntrinsicContentSize()
        }
    }
    
    override var intrinsicContentSize: CGSize {
        self.layoutIfNeeded()
        return CGSize(width: UIViewNoIntrinsicMetric, height: contentSize.height)
    }
}
