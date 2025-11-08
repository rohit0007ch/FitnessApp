//
//  CreateProfileVC.swift
//  FitnessApp
//
//  Created by ROHIT on 29/07/25.
//

import UIKit

class CreateProfileVC: UIViewController, UIImagePickerControllerDelegate , UINavigationControllerDelegate {

   
    @IBOutlet weak var t5: UITextField!
    @IBOutlet weak var t1: UITextField!
    @IBOutlet weak var t2: UITextField!
    @IBOutlet weak var t3: UITextField!
    @IBOutlet weak var textfield: UITextField!
    @IBOutlet weak var t4: UITextField!
    @IBOutlet weak var profileview: UIView!
    
    @IBOutlet weak var imageview: UIImageView!
        @IBOutlet weak var submitbtn: UIButton!
   
  //  var completion : ((String) -> Void)?
    override func viewDidLoad() {
        self.navigationItem.hidesBackButton = true
        super.viewDidLoad()
      
            profileview.layer.cornerRadius = 50.0
            profileview.layer.masksToBounds = true
        let allFields = [textfield, t1, t2, t3, t4, t5]
             for tf in allFields {
                 tf?.layer.cornerRadius = 15.0
                 tf?.layer.borderWidth = 1.0
                 tf?.layer.borderColor = UIColor.gray.cgColor
                 if let placeholder = tf?.placeholder {
                     tf?.attributedPlaceholder = NSAttributedString(
                         string: placeholder,
                         attributes: [.foregroundColor: UIColor.lightGray]
                     )
                 }
             }
             
             // Setup submit button
             submitbtn.layer.cornerRadius = 25.0
             submitbtn.layer.masksToBounds = true
    
                    }
    
    @IBAction func imagebtn(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .photoLibrary
        self.present(imagePicker, animated: true, completion: nil)
        }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        let originalImage = info[.originalImage] as! UIImage
        self.imageview.image = originalImage
        
    }
    func imagePickerControllerDidCancel(_ imagePicker: UIImagePickerController) {
        imagePicker.dismiss(animated: true)
    }
                    
    @IBAction func back(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    // Method to check if all fields are filled
    
                    
    @IBAction func Submitbtn(_ sender: Any) {
            // Collect all fields (optionals)
            let allFields = [textfield, t1, t2, t3, t4, t5]

            // Validate: check every field is not empty
            for field in allFields {
                if field?.text?.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ?? true {
                    showAlert(title: "Error", message: "All fields must be filled.")
                    return
                }
            }

            // All fields filled - continue with saving

            let defaults = UserDefaults.standard
            guard let email = defaults.string(forKey: "current_user_email") else {
                print("No logged in user email found")
                return
            }

            let profile: [String: String] = [
                "field1": t1.text ?? "",
                "field2": t2.text ?? "",
                "field3": t4.text ?? "",
                "field4": t5.text ?? "",
                "field5": t3.text ?? "",
                "field6": textfield.text ?? ""
            ]

            // Save profile dictionary per user key
            defaults.set(profile, forKey: "UserProfile_\(email)")

            // Save profile image if exists
            if let image = imageview.image, let imageData = image.pngData() {
                defaults.set(imageData, forKey: "UserProfileImage_\(email)")
            }

            // Show alert and navigate after confirmation
            let alert = UIAlertController(title: "Saved", message: "Your profile has been saved locally.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
                if let loginVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC") as? LoginVC {
                    self.navigationController?.pushViewController(loginVC, animated: true)
                }
            }))
            present(alert, animated: true)
        }

        // Helper alert method
        func showAlert(title: String, message: String) {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true)
        }

       
    @IBAction func datepickbtn(_ sender: Any) {
        let alert = UIAlertController(title: "Select Date", message: "\n\n\n\n\n\n\n\n", preferredStyle: .actionSheet)

            let picker = UIDatePicker()
            picker.datePickerMode = .date
            if #available(iOS 13.4, *) {
                picker.preferredDatePickerStyle = .wheels
            }

            alert.view.addSubview(picker)

            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            alert.addAction(UIAlertAction(title: "Select", style: .default, handler: { _ in
                let formatter = DateFormatter()
                formatter.dateFormat = "dd/MM/yyyy"  // Set date format to DD/MM/YYYY
                self.t4.text = formatter.string(from: picker.date)
            }))

            self.present(alert, animated: true, completion: nil)
        }
    
    @IBAction func dropDownbtn(_ sender: Any) {
        let genderOptions = ["Male", "Female", "Other"]
          let alert = UIAlertController(title: "Select Gender", message: nil, preferredStyle: .actionSheet)
          for gender in genderOptions {
              alert.addAction(UIAlertAction(title: gender, style: .default, handler: { _ in
                  self.t5.text = gender // Set selection in your gender text field
              }))
          }
          alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
          present(alert, animated: true)
    }
   
  }
    
    
  

                
            
