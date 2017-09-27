//
//  UIColor+Random.swift
//  Geometry
//
//  Created by Shingai Yoshimi on 2017/09/26.
//  Copyright © 2017年 Yoshimi. All rights reserved.
//

import UIKit

extension UIColor {
    class func random() -> UIColor {
        let r = CGFloat(arc4random() % 255) / 255
        let g = CGFloat(arc4random() % 255) / 255
        let b = CGFloat(arc4random() % 255) / 255
        return UIColor(red: r, green: g, blue: b, alpha: 1)
    }
}
