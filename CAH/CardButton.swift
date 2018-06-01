//
//  CardButtonBlack.swift
//  CAH
//
//  Created by Dennis Muensterer on 17.01.18.
//  Copyright © 2018 Dennis Muensterer. All rights reserved.
//

import UIKit

@IBDesignable open class CardButton: UIButton {
    
    @IBInspectable var cornerRadius: CGFloat = 12{
        didSet {
            self.refreshCorners(value: cornerRadius)
        }
    }
//    @IBInspectable var shadowOffsetWidth: CGFloat = 0
//    @IBInspectable var shadowOffsetHeight: CGFloat = 0
    @IBInspectable var shadowColor: UIColor = UIColor.black
    @IBInspectable var shadowOpacity: Float = 0.5
    
    @IBInspectable var buttonText: String = "Black Card"{
        didSet{
            self.setTitle(buttonText, for: .normal)
        }
    }
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        sharedInit()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        sharedInit()
    }
    
    override open func prepareForInterfaceBuilder() {
        sharedInit()
    }
    
    func sharedInit() {
        // Common logic goes here
        refreshCorners(value: cornerRadius)

    }
    
    func refreshCorners(value: CGFloat) {
        layer.cornerRadius = value
    }
    
    func updateText(title: String = "Black Card") {
        self.setTitle(title, for: .normal)
    }
    
//    override open func layoutSubviews() {
//        layer.cornerRadius = cornerRadius
//        layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight)
//        layer.shadowColor = shadowColor.cgColor
//        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
//        layer.shadowPath = shadowPath.cgPath
//        layer.shadowOpacity = shadowOpacity
//    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
    

