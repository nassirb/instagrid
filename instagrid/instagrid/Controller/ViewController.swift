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
    
    @IBOutlet weak var checkMark1: UIView!
    @IBOutlet weak var checkMark2: UIView!
    @IBOutlet weak var checkMark3: UIView!
    
    @IBOutlet weak var swipeUp: UIView!
    @IBOutlet weak var swipeLeft: UIView!
    
//    uiTapGesture ici ensuite j'utilise la methode update lyout de la class gridView
    
    @objc private func didTapBtn1(){
        gridView.updateLayout(layout: .layout1)
        checkMark1.isHidden = false
        checkMark2.isHidden = true
        checkMark3.isHidden = true
    }
    @objc private func didTapBtn2(){
        gridView.updateLayout(layout: .layout2)
        checkMark1.isHidden = true
        checkMark2.isHidden = false
        checkMark3.isHidden = true
    }
    @objc private func didTapBtn3(){
        gridView.updateLayout(layout: .layout3)
        checkMark1.isHidden = true
        checkMark2.isHidden = true
        checkMark3.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gridView.hideView()
        swipeLeft.isHidden = true
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapBtn1))
        layoutButton1.addGestureRecognizer(tapGestureRecognizer)
        
        let tapGestureRecognizer2 = UITapGestureRecognizer(target: self, action: #selector(didTapBtn2))
        layoutButton2.addGestureRecognizer(tapGestureRecognizer2)
        
        let tapGestureRecognizer3 = UITapGestureRecognizer(target: self, action: #selector(didTapBtn3))
        layoutButton3.addGestureRecognizer(tapGestureRecognizer3)
        
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        if UIDevice.current.orientation.isLandscape{
            print("landscape")
            swipeLeft.isHidden = false
            swipeUp.isHidden = true
        } else {
            print("portrait")
            swipeLeft.isHidden = true
            swipeUp.isHidden = false
        }
    }


}

