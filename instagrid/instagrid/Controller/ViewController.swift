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
    
    var selectedImageView: UIImageView!
    
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
        setupGesture()
        
        swipeGesture()

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
    
    @objc private func didTapPlusTopLeft(){
        selectedImageView = gridView.topLeftSquareImage
        didTapPlus()
        gridView.topLeftSquarePlus.isHidden = true
    }
    @objc private func didTapPlusTopRight(){
        selectedImageView = gridView.topRightSquareImage
        didTapPlus()
        gridView.topRightSquarePlus.isHidden = true
    }
    @objc private func didTapPlusBottomLeft(){
        selectedImageView = gridView.bottomLeftSquareImage
        didTapPlus()
        gridView.bottomLeftSquarePlus.isHidden = true
    }
    @objc private func didTapPlusBottomRight(){
        selectedImageView = gridView.bottomRightSquareImage
        didTapPlus()
        gridView.bottomRightSquarePlus.isHidden = true
    }
    @objc private func didTapPlusTopRect(){
        selectedImageView = gridView.topRectangleImage
        didTapPlus()
        gridView.topRectanglePlus.isHidden = true
    }
    @objc private func didTapPlusBottomRect(){
        selectedImageView = gridView.bottomRectangleImage
        didTapPlus()
        gridView.bottomRectanglePlus.isHidden = true
    }
    
    func setupGesture(){
        let tapGestureRecognizerPlus = UITapGestureRecognizer(target: self, action: #selector(didTapPlusTopLeft))
        gridView.topLeftSquare.addGestureRecognizer(tapGestureRecognizerPlus)
        
        let tapGestureRecognizerPlus2 = UITapGestureRecognizer(target: self, action: #selector(didTapPlusTopRight))
        gridView.topRightSquare.addGestureRecognizer(tapGestureRecognizerPlus2)
        
        let tapGestureRecognizerPlus3 = UITapGestureRecognizer(target: self, action: #selector(didTapPlusBottomLeft))
        gridView.bottomLeftSquare.addGestureRecognizer(tapGestureRecognizerPlus3)
        
        let tapGestureRecognizerPlus4 = UITapGestureRecognizer(target: self, action: #selector(didTapPlusBottomRight))
        gridView.bottomRightSquare.addGestureRecognizer(tapGestureRecognizerPlus4)
        
        let tapGestureRecognizerPlus5 = UITapGestureRecognizer(target: self, action: #selector(didTapPlusTopRect))
        gridView.topRectangle.addGestureRecognizer(tapGestureRecognizerPlus5)
        
        let tapGestureRecognizerPlus6 = UITapGestureRecognizer(target: self, action: #selector(didTapPlusBottomRect))
        gridView.bottomRectangle.addGestureRecognizer(tapGestureRecognizerPlus6)
    }
    
    func didTapPlus() {
         let vc = UIImagePickerController()
         vc.sourceType = .photoLibrary
         vc.delegate = self
         vc.allowsEditing = true
         present(vc, animated: true)
    }
    
    
    @objc private func didSwipeUp(){
        print("SwipeUp")
        
        if UIDevice.current.orientation.isLandscape{
            return
        }

        UIGraphicsBeginImageContext(gridView.frame.size)
        gridView.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        let ac = UIActivityViewController(activityItems: [image!], applicationActivities: nil)
        present(ac, animated: true, completion: {
                UIView.animate(withDuration: 2.0) {
                self.gridView.transform = CGAffineTransform(translationX: self.gridView.bounds.origin.x, y: -2000)
            }
        })
    }
    @objc private func didSwipeLeft(){
        print("SwipeLeft")
        
        if UIDevice.current.orientation.isPortrait{
            return
        }

        UIGraphicsBeginImageContext(gridView.frame.size)
        gridView.layer.render(in: UIGraphicsGetCurrentContext()!)
        let imageL = UIGraphicsGetImageFromCurrentImageContext()
        let acL = UIActivityViewController(activityItems: [imageL!], applicationActivities: nil)
        present(acL, animated: true, completion: {
                UIView.animate(withDuration: 2.0) {
                self.gridView.transform = CGAffineTransform(translationX: -2000, y:  self.gridView.bounds.origin.y)
            }
        })
    }
    
    func swipeGesture(){
        let swipeGestureRecognizerUp = UISwipeGestureRecognizer(target: self, action: #selector(didSwipeUp))
        swipeGestureRecognizerUp.direction = .up
        gridView.addGestureRecognizer(swipeGestureRecognizerUp)
        
        let swipeGestureRecognizerLeft = UISwipeGestureRecognizer(target: self, action: #selector(didSwipeLeft))
        swipeGestureRecognizerLeft.direction = .left
        gridView.addGestureRecognizer(swipeGestureRecognizerLeft)
    }
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.editedImage] as? UIImage {
            selectedImageView.image = image
       }
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
