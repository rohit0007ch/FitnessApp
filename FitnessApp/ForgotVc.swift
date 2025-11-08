//
//  ForgotVc.swift
//  FitnessApp
//
//  Created by ROHIT on 28/07/25.
//

import UIKit

class ForgotVc: UIViewController {
    
    @IBOutlet weak var otpbtn: UIButton!
    @IBOutlet weak var textfield: UITextField!
    var completion : ((String) -> Void)?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        textfield.layer.cornerRadius = 15.0
        textfield.layer.borderWidth = 1.0
        textfield.layer.borderColor = UIColor.gray.cgColor
        if let placeholder = textfield.placeholder {
            textfield.attributedPlaceholder = NSAttributedString(
                string: placeholder,
                attributes: [.foregroundColor: UIColor.lightGray]
            )
        }
        otpbtn.layer.cornerRadius = 25.0
        
    }
    
    @IBAction func back(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func SendOtp(_ sender: Any) {
       /*  if let completionHandler = completion {
         completionHandler(textfield.text ?? "")
         }
        
        if let sendotp = self.storyboard?.instantiateViewController(identifier: "ForgotVc") as? ForgotVc  {
            
            // Pass data back using closure
            sendotp.completion = {  data in
                self.textfield.text = data
            }
            */
        
        
        let sendotp = self.storyboard?.instantiateViewController(withIdentifier: "OtpVC") as! OtpVC
            // Push to OTP screen
            self.navigationController?.pushViewController(sendotp, animated: true)
            
        }
    }

