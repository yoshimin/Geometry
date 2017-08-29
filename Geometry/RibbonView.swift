//
//  RibbonView.swift
//  Geometry
//
//  Created by 新谷　よしみ on 2017/08/28.
//  Copyright © 2017年 Yoshimi. All rights reserved.
//

import UIKit

@IBDesignable
class RibbonView: UIView {
    fileprivate let animationKey = "rotation"
    var duration: CFTimeInterval = 0.25
    var startDegree: CGFloat = 180
    var delay: CFTimeInterval = 1
    var color: UIColor = UIColor.gray
    
    func radian(_ angle: CGFloat) -> CGFloat {
        return angle * CGFloat(Double.pi) / 180
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        backgroundColor = UIColor.clear
    }
    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        
        let center = CGPoint(x:rect.width*0.5, y:rect.height*0.5)
        let radius = rect.width*0.5
        
        path.move(to: center)
        path.addArc(withCenter: center, radius: radius, startAngle: radian(startDegree), endAngle: radian(startDegree + 90), clockwise: true)
        path.move(to: center)
        path.addArc(withCenter: center, radius: radius, startAngle: radian(startDegree - 180), endAngle: radian(startDegree - 90), clockwise: true)
        
        path.close()
        
        color.set()
        path.stroke()
        path.fill()
        
        layer.removeAnimation(forKey: animationKey)
        
        let animation = CAKeyframeAnimation(keyPath: "transform.rotation")
        animation.duration = duration + delay
        
        animation.values = [
            0,
            Double.pi * 0.5,
            Double.pi * 0.5
        ]
        animation.keyTimes = [
            0,
            NSNumber(value: duration / animation.duration),
            1
        ]
        animation.repeatCount = MAXFLOAT
        animation.isCumulative = true
        
        layer.add(animation, forKey: animationKey)
    }
}
