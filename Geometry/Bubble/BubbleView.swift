//
//  BubbleView.swift
//  Geometry
//
//  Created by Shingai Yoshimi on 2017/09/24.
//  Copyright © 2017年 Yoshimi. All rights reserved.
//

import UIKit

class BubbleView: UIView {
    let number = 80 
    
    private let animationKey = "fadeAnimation"
    private var layers: [CAShapeLayer] = []
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        for _ in 0...number {
            layers += [addCircleLayer(color: UIColor.random())]
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        for (_, layer) in layers.enumerated() {
            let x = CGFloat(arc4random()).truncatingRemainder(dividingBy: frame.width)
            let y = CGFloat(arc4random()).truncatingRemainder(dividingBy: frame.height)
            let radius = CGFloat(arc4random() % 15) + 5
            layer.path = UIBezierPath(arcCenter: CGPoint(x: x, y: y), radius: radius, startAngle: 0, endAngle: CGFloat.pi * 2, clockwise: true).cgPath
            
            layer.removeAnimation(forKey: animationKey)
            
            let animation = CAKeyframeAnimation(keyPath: "opacity")
            
            animation.duration = (TimeInterval(arc4random() % 50) + 20) / 10
            animation.values = [0, 1, 0]
            animation.repeatCount = .infinity
            layer.add(animation, forKey: animationKey)
        }
    }
    
    func addCircleLayer(color: UIColor) -> CAShapeLayer {
        let layer = CAShapeLayer()
        layer.fillColor = color.cgColor
        self.layer.addSublayer(layer)
        return layer
    }

}
