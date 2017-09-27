//
//  SpiralView.swift
//  Geometry
//
//  Created by 新谷　よしみ on 2017/08/30.
//  Copyright © 2017年 Yoshimi. All rights reserved.
//

import UIKit

class SpiralView: UIView {
    internal let layers = 10
    internal let lineWidth: CGFloat = 4
    internal let spiral = CAShapeLayer()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let interval: CGFloat = 4
        
        let spiralPath = UIBezierPath()
        spiralPath.move(to: CGPoint.zero)
        
        var center = CGPoint.zero
        for i in 0...layers*4 {
            let radius = CGFloat(i) * interval
            let startAngle = Double(i%4) * Double.pi * 0.5
            let endAngle = startAngle + Double.pi * 0.5
            center = CGPoint(x: center.x - interval * CGFloat(cos(startAngle)), y: center.y - interval * CGFloat(sin(startAngle)))
            spiralPath.addArc(withCenter: center, radius: CGFloat(radius), startAngle: CGFloat(startAngle), endAngle: CGFloat(endAngle), clockwise: true)
        }
        
        spiral.position = CGPoint(x: frame.width*0.5, y:frame.height*0.5)
        spiral.path = spiralPath.cgPath
        spiral.fillColor = UIColor.clear.cgColor
        spiral.lineWidth = lineWidth
        spiral.strokeColor = UIColor.lightGray.cgColor
        spiral.strokeEnd = 0.5
        layer.addSublayer(spiral)
        
        let animation = CAKeyframeAnimation(keyPath: "strokeEnd")
        
        animation.duration = 20
        animation.values = [0, 1, 0]
        animation.repeatCount = .infinity
        animation.isCumulative = true
        
        spiral.add(animation, forKey: animation.keyPath)
    }

}
