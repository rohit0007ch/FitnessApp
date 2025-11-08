//
//  OtpVC.swift
//  FitnessApp
//
//  Created by ROHIT on 28/07/25.
//

import UIKit
// Naming convention Format
/*
 txtRelatedName
 lblUserName
 btnLogin
 viewBackground
 
 */

class OtpVC: UIViewController {
    
    
    // MARK: - @IBOutlet
    @IBOutlet weak var t2: UITextField!
    @IBOutlet weak var t3: UITextField!
    @IBOutlet weak var t4: UITextField!
    @IBOutlet weak var t1: UITextField!
    @IBOutlet weak var verifybtn: UIButton!
    
    
    // MARK: - lifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        
        verifybtn.layer.cornerRadius = 25.0
     
        t1.layer.borderWidth = 1.0
        
        t1.layer.cornerRadius = 15.0
        t1.layer.masksToBounds = true
        t1.layer.borderColor = UIColor.gray.cgColor
        
        if let placeholder = t1.placeholder {
            t1.attributedPlaceholder = NSAttributedString(
                string: placeholder,
                attributes: [.foregroundColor: UIColor.lightGray]
            )
            
        }
        
        t2.layer.cornerRadius = 15.0
        t2.layer.masksToBounds = true
        t2.layer.borderColor = UIColor.gray.cgColor
        t2.layer.borderWidth = 1.0
        if let placeholder = t2.placeholder {
            t2.attributedPlaceholder = NSAttributedString(
                string: placeholder,
                attributes: [.foregroundColor: UIColor.lightGray]
            )
        }
                
                
                t3.layer.cornerRadius = 15.0
                t3.layer.masksToBounds = true
                t3.layer.borderColor = UIColor.gray.cgColor
                t3.layer.borderWidth = 1.0
        if let placeholder = t3.placeholder {
            t3.attributedPlaceholder = NSAttributedString(
                string: placeholder,
                attributes: [.foregroundColor: UIColor.lightGray]
            )
        }
                    
                    t4.layer.cornerRadius = 15.0
                    t4.layer.masksToBounds = true
                    t4.layer.borderColor = UIColor.gray.cgColor
                    t4.layer.borderWidth = 1.0
                    if let placeholder = t4.placeholder {
                        t4.attributedPlaceholder = NSAttributedString(
                            string: placeholder,
                            attributes: [.foregroundColor: UIColor.lightGray]
                        )
                    }
        
    }
    
    @IBAction func backotp(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
  
}
