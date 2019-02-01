//
//  OverlayBadgeView.swift
//  iExtra
//
//  Created by Daniel Saidi on 2019-02-01.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

/*
 
 Before you can use this class or any of its subclasses, you
 must register images for the sizes you intend to use, using
 the available appearance proxy properties.
 
 */

import UIKit

open class OverlayBadgeView: OverlayView {

    // MARK: - Initialization
    
    public init(size: Size) {
        super.init(frame: .zero)
        self.size = size
        accessibilityTraits = .button
    }
    
    public required init?(coder aDecoder: NSCoder) { fatalError() }
    
    
    // MARK: - View Lifecycle
    
    open override func didMoveToWindow() {
        super.didMoveToWindow()
        resizeToFitImage()
        makeRoundWithWidthRadius()
        center = superview?.center ?? .zero
    }
    
    
    // MARK: - Enums
    
    public enum Size {
        case small, medium, large
    }
    
    
    // MARK: - Appearance Proxy Properties
    
    @objc public dynamic var smallImage: UIImage?
    @objc public dynamic var mediumImage: UIImage?
    @objc public dynamic var largeImage: UIImage?
    
    
    // MARK: - Properties
    
    public var size: Size = .medium
    
    public var image: UIImage? {
        switch size {
        case .small: return smallImage
        case .medium: return mediumImage
        case .large: return largeImage
        }
    }
    
    public var imagePadding: CGFloat {
        let size = image?.size ?? .zero
        return max(size.width, size.height)
    }
    
    private lazy var imageView: UIImageView = {
        let view = UIImageView(image: image)
        addSubview(view)
        view.autoresizingMask = [
            .flexibleTopMargin, .flexibleBottomMargin,
            .flexibleLeftMargin, .flexibleRightMargin
        ]
        return view
    }()
}


private extension OverlayBadgeView {
    
    func resizeToFitImage() {
        let padding = -imagePadding
        let size = imageView.frame.insetBy(dx: padding, dy: padding).size
        let maxSize = max(size.width, size.height)
        let frameSize = CGSize(width: maxSize, height: maxSize)
        if frame.size == frameSize { return }
        frame.size = frameSize
    }
}

