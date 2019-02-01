//
//  OverlayViewContainer.swift
//  iExtra
//
//  Created by Daniel Saidi on 2019-02-01.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import UIKit

public class OverlayViewContainer: UIView {
    
    init(view: OverlayBadgeView) {
        super.init(frame: .zero)
        addSubview(view)
        view.autoresizingMask = .centerInParent
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
}
