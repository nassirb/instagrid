//
//  ViewController.swift
//  instagrid
//
//  Created by Nassir Bouredenna on 02/06/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var gridView: GridView!
    @IBOutlet weak var layoutButton1: UIView!
    @IBOutlet weak var layoutButton2: UIView!
    @IBOutlet weak var layoutButton3: UIView!
    
//    uiTapGesture ici ensuite j'utilise la methode update lyout de la class gridView 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gridView.hideView()
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        
    }


}

