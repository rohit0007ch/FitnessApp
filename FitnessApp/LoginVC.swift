//
//  ViewController.swift
//  FitnessApp
//
//  Created by ROHIT on 28/07/25.
//

import UIKit

class LoginVC: UIViewController {
    @IBOutlet weak var textfield1: UITextField!
    @IBOutlet weak var loginbtn: UIButton!
    @IBOutlet weak var textfield: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        textfield.layer.cornerRadius = 16.0
        textfield.layer.borderWidth = 1.0          // Set your desired border width
        textfield.layer.borderColor = UIColor.gray.cgColor
        textfield1.layer.cornerRadius = 16.0
        textfield1.layer.borderWidth = 1.5          // Set your desired border width
        textfield1.layer.borderColor = UIColor.gray.cgColor
        loginbtn.layer.cornerRadius =  25.0
        
        if let placeholder = textfield.placeholder {
            textfield.attributedPlaceholder = NSAttributedString(
                string: placeholder,
                attributes: [.foregroundColor: UIColor.lightGray]
            )
        }
        if let placeholder = textfield1.placeholder {
            textfield1.attributedPlaceholder = NSAttributedString(
                string: placeholder,
                attributes: [.foregroundColor: UIColor.lightGray]
            )
        }
    }
    @IBAction func forgotpass(_ sender: UIButton) {
        
        
        let vc = storyboard?.instantiateViewController(identifier: "ForgotVc") as! ForgotVc
        
        /* vc.completion = {
         value in
         self.textfield1.text = value
         }*/
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func signup(_ sender: UIButton) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "SignUpVC") as! SignUpVC
      /*  vc.completion = { data in
            self.textfield1.text = data["field1"] ?? ""
            self.textfield.text = data["field2"] ?? ""*/
        
        
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @IBAction func loginbtn(_ sender: Any) {
        let enteredEmail = textfield1.text ?? ""
        let enteredPassword = textfield.text ?? ""
        // Load all saved accounts (array of dictionaries)
        let accounts = UserDefaults.standard.value(forKey: "user_accounts") as? [[String: String]] ?? []
        print(accounts)
        // Check if any account matches entered credentials
        let isValidUser = accounts.contains { account in
            account["email"] == enteredEmail && account["password"] == enteredPassword
            
        }
        let defaults = UserDefaults.standard
        defaults.set(true, forKey: "isLoggedIn")                   // Mark logged in
        defaults.set(enteredEmail, forKey: "current_user_email")          // Save user identity
        defaults.synchronize()                                      // Make sure it's saved immediately

        if isValidUser {
            let alert = UIAlertController(title: "Login Success", message: "Welcome!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
                // Optionally, save the logged-in user's email to UserDefaults so their data can be shown later
                UserDefaults.standard.set(enteredEmail, forKey: "current_user_email")
           
                // Navigate only after pressing OK
                if let tabBarVC = self.storyboard?.instantiateViewController(withIdentifier: "MainTabBarController") as? UINavigationController {
                    tabBarVC.modalPresentationStyle = .fullScreen
                    self.present(tabBarVC, animated: true, completion: nil)
                }
            }))
            present(alert, animated: true)
            
        } else {
            let alert = UIAlertController(title: "Login Failed", message: "Incorrect email or password.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true)
        }
    }
}
