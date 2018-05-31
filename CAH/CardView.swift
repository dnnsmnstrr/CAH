//
//  CardView.swift
//  CAH
//
//  Created by Dennis Muensterer on 17.01.18.
//  Copyright © 2018 Dennis Muensterer. All rights reserved.
//

import UIKit

@IBDesignable class CardView: UIView {
    
    @IBInspectable var cornerradius: CGFloat = 12
    @IBInspectable var shadowOffsetWidth: CGFloat = 0
    @IBInspectable var shadowOffsetHeight: CGFloat = 0
    @IBInspectable var shadowColor: UIColor = UIColor.black
    @IBInspectable var shadowOpacity: Float = 0.5
    
    override func layoutSubviews() {
        layer.cornerRadius = cornerradius
        layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight)
        layer.shadowColor = shadowColor.cgColor
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerradius)
        layer.shadowPath = shadowPath.cgPath
        layer.shadowOpacity = shadowOpacity
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
