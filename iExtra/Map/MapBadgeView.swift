//
//  MapBadgeView.swift
//  iExtra
//
//  Created by Daniel Saidi on 2016-10-12.
//  Copyright © 2016 Daniel Saidi. All rights reserved.
//

import MapKit
import UIKit

open class MapBadgeView: UIView {
    
    
    // MARK: - Initialization
    
    public convenience init() {
        self.init(frame: CGRect.zero)
        setup()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    open override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setup()
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        refresh()
    }
    
    
    // MARK: - Appearance Properties
    
    @objc public dynamic var borderColor: UIColor = UIColor.lightGray
    @objc public dynamic var borderWidth: CGFloat = 1
    @objc public dynamic var mapPadding: CGFloat = 2
    
    
    // MARK: - Properties
    
    public var mapView: MKMapView! {
        didSet {
            subviews.forEach { $0.removeFromSuperview() }
            mapView.isUserInteractionEnabled = false
            mapView.hideLegalLabel()
            addSubview(mapView)
        }
    }
    
    
    // MARK: - Public Functions
    
    open func setup() {
        mapView = MKMapView()
    }
}


// MARK: - Public Functions

public extension MapBadgeView {
    
    public func prepareForNavigationController(in vc: UIViewController) {
        vc.edgesForExtendedLayout = .top
    }
}


// MARK: - Private functions

private extension MapBadgeView {
    
    func applyBorderStyle(to view: UIView) {
        let layer = view.layer
        layer.borderColor = borderColor.cgColor
        layer.borderWidth = borderWidth
    }
    
    func refresh() {
        roundByWidth()
        mapView.frame = self.bounds.insetBy(dx: mapPadding, dy: mapPadding)
        mapView.roundByWidth()
        applyBorderStyle(to: self)
        applyBorderStyle(to: mapView)
    }
}
