//
//  SignUpViewController.swift
//  iOS_Project2_20200907
//
//  Created by 김태훈 on 2020/09/07.
//  Copyright © 2020 thoonk. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    @IBOutlet weak var rePwTextField: UITextField!
    @IBOutlet weak var introTextView: UITextView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!

    lazy var imagePicker: UIImagePickerController = {
        let picker: UIImagePickerController = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        picker.allowsEditing = true
        return picker
    }()
    
    
    @IBAction func tapSelectImageView(_ sender: Any){
        self.present(self.imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func tapView(_ sender: UITapGestureRecognizer){
        self.view.endEditing(true)
        
        if idTextField.text != nil && pwTextField.text != nil && rePwTextField != nil && introTextView != nil && pwTextField.text! == rePwTextField.text!{
                nextButton.isEnabled = true
            
        }
        else {
            nextButton.isEnabled = false
        }
    }
    
    @IBAction func touchUpCancel(_ sender: UIButton){
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func touchUpNext(_ sender: UIButton){
        UserInformation.shared.id = idTextField.text!
        UserInformation.shared.password = pwTextField.text!
        UserInformation.shared.introduce = introTextView.text!
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let originalImage: UIImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            self.imageView.image = originalImage
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextButton.isEnabled = false
        
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.tapView(_:)))
        
        let tapGestureImageView: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.tapSelectImageView(_:)))
        
        self.imageView.addGestureRecognizer(tapGestureImageView)
        self.view.addGestureRecognizer(tapGesture)
    }
    
}
