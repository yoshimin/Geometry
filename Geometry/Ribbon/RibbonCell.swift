//
//  RibbonCell.swift
//  Geometry
//
//  Created by 新谷　よしみ on 2017/08/28.
//  Copyright © 2017年 Yoshimi. All rights reserved.
//

import UIKit

class RibbonCell: UICollectionViewCell {
    @IBOutlet var ribbon: RibbonView?
    
    var duration: CFTimeInterval {
        get {
            return (ribbon?.duration)!
        }
        set {
            ribbon?.duration = newValue
        }
    }
    
    var startDegree: CGFloat {
        get {
            return (ribbon?.startDegree)!
        }
        set {
            ribbon?.startDegree = newValue
        }
    }
    
    var delay: CFTimeInterval {
        get {
            return (ribbon?.delay)!
        }
        set {
            ribbon?.delay = newValue
        }
    }
    
    var color: UIColor {
        get {
            return (ribbon?.color)!
        }
        set {
            ribbon?.color = newValue
        }
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        ribbon?.setNeedsDisplay()
    }
}
