//
//  GridView.swift
//  instagrid
//
//  Created by Nassir Bouredenna on 29/06/2021.
//

import UIKit


enum LayoutType {
    case <#case#>
}

class GridView: UIView {
    @IBOutlet var mainView : UIView!
    @IBOutlet var firstSquare : UIView!
    
    func hideView(){
        mainView.isHidden = true
    }
}

