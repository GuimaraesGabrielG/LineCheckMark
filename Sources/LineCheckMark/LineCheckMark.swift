//
//  CheckMarkLine.swift
//  line
//
//  Created by Gabriel Gonçalves Guimarães on 04/02/21.
//  Copyright © 2021 Gabriel Gonçalves Guimarães. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable class CheckMarkLine: UIView {
 
    let gradient = CAGradientLayer()

    @IBInspectable var animationDuration: Double = 2 {
        didSet {
            setup()
        }
    }
    
    @IBInspectable var sizeLine: CGFloat = 3 {
        didSet {
            setup()
        }
    }
    
    @IBInspectable var lineBackgroundColor: UIColor = .black {
           didSet {
               setup()
           }
       }
    
    @IBInspectable var addAnimation: Bool = false {
           didSet {
               setup()
           }
       }

    lazy var  path: UIBezierPath = {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: self.bounds.maxY * 0.06, y: self.bounds.midY + self.bounds.midY * 0.2))
        path.addLine(to: CGPoint(x: self.bounds.maxX * 0.35, y:  self.bounds.maxY * 0.9))
        path.addLine(to: CGPoint(x: self.bounds.maxX * 0.94, y:  self.bounds.maxY * 0.25))
        
        return path
    }()
    
    let animation: CABasicAnimation = {
        
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0
        animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        return animation
    }()
    
    lazy var shapeLayer:CAShapeLayer = {
        let shapeLayer = CAShapeLayer()
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineWidth = 15
        shapeLayer.lineCap = CAShapeLayerLineCap.round
        
        shapeLayer.path = path.cgPath
        
        
        self.backgroundColor = .clear
        
        return shapeLayer
    }()
    
    private func setup() {
        self.animation.duration = animationDuration
        self.shapeLayer.lineWidth = sizeLine
        self.shapeLayer.strokeColor = lineBackgroundColor.cgColor
        self.layer.addSublayer(shapeLayer)
        layer.addSublayer(gradient)

        if(addAnimation){
            shapeLayer.add(animation, forKey: "MuAnimation")
        }
        
        self.addGradient()

    }
    
    
    
    private func addGradient() {
        gradient.colors = [UIColor.orange.cgColor, UIColor.red.cgColor]
        gradient.frame = self.bounds
        gradient.startPoint = CGPoint(x: 0.5, y: 0.0)
        gradient.endPoint = CGPoint(x: 0.5, y: 1.0)
        gradient.mask = shapeLayer
    }
 
    
}
