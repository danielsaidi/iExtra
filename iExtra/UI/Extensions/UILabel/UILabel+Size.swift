//
//  UICollectionViewCell+Size.swift
//  iExtra
//
//  Created by Daniel Saidi on 2018-08-06.
//  Copyright © 2018 Daniel Saidi. All rights reserved.
//

import UIKit

extension UILabel {
    
    func calculateWidth() -> CGFloat {
        guard let text = text else { return 0 }
        let size = CGSize(width: 10000, height: 0)
        let rect = text.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: [.font: font], context: nil)
        return rect.width + 10
    }
}
