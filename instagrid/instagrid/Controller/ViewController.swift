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
    override func viewDidLoad() {
        super.viewDidLoad()
        gridView.hideView()
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        
    }


}

