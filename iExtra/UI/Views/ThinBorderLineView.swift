//
//  ThinBorderLineView.swift
//  iExtra
//
//  Created by Daniel Saidi on 2017-02-08.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

import UIKit

public class ThinBorderLineView: UIView {
    
    
    // MARK: - Functions
    
    override public func layoutSubviews() {
        adjustHeight()
        adjustWidth()
    }
}


// MARK: - Private functions

private extension ThinBorderLineView {
    
    func adjustHeight() {
        guard frame.size.height == 1 else { return }
        frame.size.height = 0.5
        guard frame.origin.y > 0 else { return }
        frame.origin.y += 0.5
    }
    
    func adjustWidth() {
        guard frame.size.width == 1 else { return }
        frame.size.width = 0.5
        guard frame.origin.x > 0 else { return }
        frame.origin.x += 0.5
    }
}
