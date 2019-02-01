//
//  UICollectionViewFlowLayout+Layouts.swift
//  iExtra
//
//  Created by Daniel Saidi on 2019-02-01.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import UIKit

public extension UICollectionViewFlowLayout {
    
    private static var idiom: UIUserInterfaceIdiom { return UIDevice.current.userInterfaceIdiom }
    
    static var isPadLayout: Bool { return isPadLayoutIdiom(idiom) }
    static var isPhoneLayout: Bool { return isPhoneLayoutIdiom(idiom) }
    static var isTVLayout: Bool { return isTVLayoutIdiom(idiom) }
    
    var idiom: UIUserInterfaceIdiom { return UICollectionViewFlowLayout.idiom }
    var isPadLayout: Bool { return UICollectionViewFlowLayout.isPadLayout }
    var isPhoneLayout: Bool { return UICollectionViewFlowLayout.isPhoneLayout }
    var isTVLayout: Bool { return UICollectionViewFlowLayout.isTVLayout }
    
    static func isPadLayoutIdiom(_ idiom: UIUserInterfaceIdiom) -> Bool {
        return idiom == .pad
    }
    
    static func isPhoneLayoutIdiom(_ idiom: UIUserInterfaceIdiom) -> Bool {
        return idiom == .phone
    }
    
    static func isTVLayoutIdiom(_ idiom: UIUserInterfaceIdiom) -> Bool {
        return idiom == .tv
    }
}
