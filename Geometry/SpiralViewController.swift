//
//  SpiralViewController.swift
//  Geometry
//
//  Created by 新谷　よしみ on 2017/08/30.
//  Copyright © 2017年 Yoshimi. All rights reserved.
//

import UIKit

class SpiralViewController: UIViewController {

    @IBOutlet weak var spiralViewWidth: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewDidLayoutSubviews() {
        if view.frame.width < view.frame.height {
            spiralViewWidth.constant = view.frame.width
        } else {
            spiralViewWidth.constant = view.frame.height
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
