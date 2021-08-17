//
//  GridView.swift
//  instagrid
//
//  Created by Nassir Bouredenna on 29/06/2021.
//

import UIKit


enum LayoutType {
    case layout1
    case layout2
    case layout3
}

class GridView: UIView {
    @IBOutlet var topRightSquare : UIView!
    @IBOutlet weak var topLeftSquare: UIView!
    @IBOutlet weak var bottomRightSquare: UIView!
    @IBOutlet weak var bottomLeftSquare: UIView!
    @IBOutlet weak var topRectangle: UIView!
    @IBOutlet weak var bottomRectangle: UIView!
    
    func hideView(){
        bottomLeftSquare.isHidden = true
        bottomRightSquare.isHidden = true
        topRectangle.isHidden = true
    }
    
    func updateLayout(layout:LayoutType){
        switch layout {
            case .layout1:
                topLeftSquare.isHidden = true
                topRightSquare.isHidden = true
                bottomRectangle.isHidden = true
                bottomLeftSquare.isHidden = false
                bottomRightSquare.isHidden = false
                topRectangle.isHidden = false
            case .layout2:
                bottomLeftSquare.isHidden = true
                bottomRightSquare.isHidden = true
                topRectangle.isHidden = true
                topLeftSquare.isHidden = false
                topRightSquare.isHidden = false
                bottomRectangle.isHidden = false
            case .layout3:
                topRectangle.isHidden = true
                bottomRectangle.isHidden = true
                topLeftSquare.isHidden = false
                topRightSquare.isHidden = false
                bottomLeftSquare.isHidden = false
                bottomRightSquare.isHidden = false
        }
    }
}

