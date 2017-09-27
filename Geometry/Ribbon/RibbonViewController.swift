//
//  ViewController.swift
//  Geometry
//
//  Created by 新谷　よしみ on 2017/08/28.
//  Copyright © 2017年 Yoshimi. All rights reserved.
//

import UIKit

private let reuseIdentifier = "RibbonCell"
private let column = 4

class RibbonViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cell = UINib(nibName: "RibbonCell", bundle: nil)
        collectionView?.register(cell, forCellWithReuseIdentifier: reuseIdentifier)
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        collectionView?.reloadData()
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}

extension RibbonViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let width = view.frame.width / CGFloat(column)
        let row = view.frame.height / width
        return column * Int(row)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! RibbonCell
        let row = indexPath.row / column
        let col = indexPath.row - (column * row)
        
        let shortDelay = 0.5
        let longDelay = shortDelay * 2 + cell.duration
        if row % 2 == col % 2 {
            cell.startDegree = 180
            cell.delay = shortDelay
            cell.color = UIColor(red: 230/255, green: 86/255, blue: 122/255, alpha: 1)
        } else {
            cell.startDegree = 90
            cell.delay = longDelay
            cell.color = UIColor(red: 242/255, green: 228/255, blue: 249/255, alpha: 1)
        }
        cell.setNeedsDisplay()
        
        return cell
    }
}

extension RibbonViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width / CGFloat(column)
        return CGSize(width: width, height: width)
    }
}
