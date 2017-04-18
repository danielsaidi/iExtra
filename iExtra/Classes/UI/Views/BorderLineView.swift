//
//  BorderLineView.swift
//  iExtra
//
//  Created by Daniel Saidi on 2017-02-08.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import UIKit

public class BorderLineView: UIView {
    
    
    // MARK: - Functions
    
    override public func layoutSubviews() {
        adjustHeight()
        adjustWidth()
    }
}


// MARK: - Private functions

fileprivate extension BorderLineView {
    
    func adjustHeight() {
        guard frame.size.height == 1 else { return }
        frame.size.height = 0.5
        if frame.origin.y > 0 {
            frame.origin.y += 0.5
        }
    }
    
    func adjustWidth() {
        guard frame.size.width == 1 else { return }
        frame.size.width = 0.5
        if frame.origin.x > 0 {
            frame.origin.x += 0.5
        }
    }
}
