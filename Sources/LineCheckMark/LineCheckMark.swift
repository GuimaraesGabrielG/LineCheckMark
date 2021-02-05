//
//  CheckMarkLine.swift
//  line
//
//  Created by Gabriel Gonçalves Guimarães on 04/02/21.
//  Copyright © 2021 Gabriel Gonçalves Guimarães. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable

/// Framework: Check Mark, you can change the color, size, have animation and gradient.
public class CheckMarkLine: UIView {
    
    // MARK: - Attributes

    /// Gradient for mark
    private let gradient = CAGradientLayer()
    
    
    /// Size line
    @IBInspectable public var sizeLine: CGFloat = 3 {
        didSet {
            setup()
        }
    }
    
    /// Color line
    /// Attention: use color or gradient
    @IBInspectable public var lineBackgroundColor: UIColor = .black {
        didSet {
            setup()
        }
    }
    
    /// Duration for animation
    /// - Note: Default : 2
    public var durationAnimation = 2{
        didSet{
            print(self.durationAnimation)
            self.animation.duration = CFTimeInterval(durationAnimation)
        }
    }
    
    /// Draw of line
    private lazy var  path: UIBezierPath = {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: self.bounds.maxY * 0.06, y: self.bounds.midY + self.bounds.midY * 0.2))
        path.addLine(to: CGPoint(x: self.bounds.maxX * 0.35, y:  self.bounds.maxY * 0.9))
        path.addLine(to: CGPoint(x: self.bounds.maxX * 0.94, y:  self.bounds.maxY * 0.25))
        
        return path
    }()
    
    /// Animation of line
    private lazy var animation: CABasicAnimation = {
        
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0
        animation.duration = CFTimeInterval(self.durationAnimation)
        animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        
        return animation
    }()
    
    /// Properties for create line
    private lazy var shapeLayer:CAShapeLayer = {
        let shapeLayer = CAShapeLayer()
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineCap = CAShapeLayerLineCap.round
        shapeLayer.path = path.cgPath
        
        return shapeLayer
    }()
    
    /// isAnimation: true or false, default duration animation: 2
    /// - Warning : Set duration animation first
    /// - Precondition: Duration animation
    /// - Note: Default 2
    public var isAnimation = false{
        didSet{
            if(isAnimation){
                shapeLayer.add(animation, forKey: "MuAnimation")
                animation.isRemovedOnCompletion = true
            }
        }
    }
    
    // MARK: - Constructor
    
    /// Frame for view
    /// - Parameter frame: CGRect(position, size)
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    /// Updatee view in storyboard
    public override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()

    }
    
    
    // MARK: - Methods
    
    /// Update properties of line
    private func setup() {
        self.shapeLayer.lineWidth = sizeLine
        self.shapeLayer.strokeColor = lineBackgroundColor.cgColor
        self.layer.addSublayer(shapeLayer)
        layer.insertSublayer(gradient, at: 0)
        
    }
    
    
    /// User set colors for gradient
    /// - Parameter colors: Color for gradient
    public func setColorsGradient(colors: [UIColor]) {
        
        gradient.colors = colors.map({ $0.cgColor })
        gradient.frame = self.bounds
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 0)
        gradient.mask = shapeLayer
    }
    
}
