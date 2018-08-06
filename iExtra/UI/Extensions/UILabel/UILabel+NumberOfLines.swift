//
//  UICollectionViewCell+NumberOfLines.swift
//  iExtra
//
//  Created by Daniel Saidi on 2018-08-06.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

import UIKit

public extension UILabel {
    
    public var totalNumberOfLines: Int {
        guard let text = text as NSString? else { return 0 }
        let size = CGSize(width: bounds.width, height: CGFloat.greatestFiniteMagnitude)
        let rect = text.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: [.font: font], context: nil)
        let lines = ceil(CGFloat(rect.height) / font.lineHeight)
        return Int(lines)
    }
}
