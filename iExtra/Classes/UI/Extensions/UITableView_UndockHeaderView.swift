//
//  UITableView_UndockHeaderView.swift
//  iExtra
//
//  Created by Daniel Saidi on 2015-10-01.
//  Copyright © 2015 Daniel Saidi. All rights reserved.
//

import UIKit

public extension UITableView {
    
    
    // MARK: Properties
    
    private var dockedViewTag: Int {
        return -1456
    }
    
    
    
    // MARK: Public functions
    
    public func dockHeaderView(from nc: UINavigationController) {
        let bar = nc.navigationBar
        let subviews = bar.subviews
        guard let view = findHeaderView(in: bar.subviews) else { return }
        view.removeFromSuperview()
        tableHeaderView = view
        contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }

    public func undockHeaderView(to nc: UINavigationController) {
        undockHeaderView(to: nc, undockedContentInsets: UIEdgeInsets.zero)
    }

    public func undockHeaderView(to nc: UINavigationController, undockedContentInsets: UIEdgeInsets) {
        guard let view = tableHeaderView else { return }
        view.tag = dockedViewTag
        nc.navigationBar.addSubview(view)
        nc.navigationBar.sendSubview(toBack: view)
        contentInset = undockedContentInsets
    }
    
    
    
    // MARK: Private functions
    
    private func findHeaderView(in subviews: [UIView]?) -> UIView? {
        return subviews?.first { $0.tag == dockedViewTag }
    }
}
