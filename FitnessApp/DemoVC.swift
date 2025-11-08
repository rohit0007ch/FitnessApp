//
//  DemoVC.swift
//  FitnessApp
//
//  Created by ROHIT on 31/07/25.
//

import UIKit

class DemoVC: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet weak var cview: UIView!
    @IBOutlet weak var imageview: UIImageView!
    let imagePicker = UIImagePickerController()
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        cview.layer.cornerRadius = 75
        cview.layer.masksToBounds = true 
      
    }
    
    @IBAction func btn(_ sender: Any) {
        self.present(imagePicker, animated: true)
        
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imagePicker.dismiss(animated: true)
        
        let editedImage = info [.editedImage] as? UIImage
        self.imageview.image = editedImage
    }
    func imagePickerControllerDidCancel(_ imagepicker: UIImagePickerController) {
        imagepicker.dismiss(animated: true)
    }
    
}
