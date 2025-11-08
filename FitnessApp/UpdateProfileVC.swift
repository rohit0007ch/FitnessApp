//
//  UpdateProfileVC.swift
//  FitnessApp
//
//  Created by ROHIT on 20/08/25.
//

import UIKit

class UpdateProfileVC: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var t5: UITextField!
    @IBOutlet weak var t1: UITextField!
    @IBOutlet weak var t2: UITextField!
    @IBOutlet weak var t3: UITextField!
    @IBOutlet weak var textfield: UITextField!
    @IBOutlet weak var t4: UITextField!
    @IBOutlet weak var wtgoalField: UITextField!
    @IBOutlet weak var pointsField: UITextField!
    @IBOutlet weak var punchField: UITextField!
    @IBOutlet weak var attendanceField: UITextField!
    
    @IBOutlet weak var profileView: UIView!
    @IBOutlet weak var updateBtn: UIButton!
    
    override func viewDidLoad() {
        loadProfileData()
        self.navigationItem.hidesBackButton = true
        super.viewDidLoad()
      profileView.layer.cornerRadius = 50.0
        profileView.layer.masksToBounds = true
        let allFields = [textfield, t1, t2, t3, t4, t5,wtgoalField,pointsField,punchField,attendanceField]
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
            // Setup submit button
            updateBtn.layer.cornerRadius = 28.0
            updateBtn.layer.masksToBounds = true
            
        }
        
        
        
        
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
        self.imageView.image = originalImage
        
    }
    func imagePickerControllerDidCancel(_ imagePicker: UIImagePickerController) {
        imagePicker.dismiss(animated: true)
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
    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    func loadProfileData() {
        let defaults = UserDefaults.standard
        guard let email = defaults.string(forKey: "current_user_email"),
              let profile = defaults.dictionary(forKey: "UserProfile_\(email)") as? [String: String] else {
            print("No saved profile found")
            return
        }

        // Set each text field with saved data
        t1.text = profile["field1"]
        t2.text = profile["field2"]
        t3.text = profile["field5"]
        t4.text = profile["field3"]
        t5.text = profile["field4"]
        textfield.text = profile["field6"]
    }

    @IBAction func editProfilebtn(_ sender: UIButton) {
        let defaults = UserDefaults.standard
           guard let email = defaults.string(forKey: "current_user_email") else {
               showAlert(title: "Error", message: "User not found.")
               return
           }
        
        let updatedProfile: [String: String] = [
               "field1": t1.text ?? "",
               "field2": t2.text ?? "",
               "field3": t4.text ?? "",
               "field4": t5.text ?? "",
               "field5": t3.text ?? "",
               "field6": textfield.text ?? ""
               
           ]
        if let image = imageView.image, let imageData = image.pngData() {
            defaults.set(imageData, forKey: "UserProfileImage_\(email)")
        }
        // Save updated profile back to UserDefaults
          defaults.set(updatedProfile, forKey: "UserProfile_\(email)")

          // Optionally notify user of success
          let alert = UIAlertController(title: "Success", message: "Profile updated successfully.", preferredStyle: .alert)
          alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
              self.navigationController?.popViewController(animated: true)
          }))
          present(alert, animated: true)
      }

      // Reusable alert helper
      func showAlert(title: String, message: String) {
          let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
          alert.addAction(UIAlertAction(title: "OK", style: .default))
          present(alert, animated: true)
      }
  
    }

