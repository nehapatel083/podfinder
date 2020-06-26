//
//  ShadowView.swift
//  PodFinder
//
//  Created by Neha Patel on 05/19/20.
//  Copyright © 2020 Neha Patel. All rights reserved.
//

import UIKit

class ShadowView: UIView {

    private var shadowLayer: CAShapeLayer!
    var cornerRadius: CGFloat = 20
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if shadowLayer == nil {
            shadowLayer = CAShapeLayer()
            shadowLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
            shadowLayer.fillColor = UIColor.white.cgColor
            shadowLayer.shadowColor = UIColor(white: 0, alpha: 0.4).cgColor
            shadowLayer.shadowOffset = .zero
            shadowLayer.shadowOpacity = 0.3
            shadowLayer.shadowRadius = 9
            shadowLayer.shadowPath = shadowLayer.path
            layer.insertSublayer(shadowLayer, at: 0)
        }
    }

}
