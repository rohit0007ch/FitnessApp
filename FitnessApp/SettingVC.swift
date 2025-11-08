//
//  SettingVC.swift
//  FitnessApp
//
//  Created by ROHIT on 18/08/25.
//

import UIKit

class SettingVC: UIViewController {
    @IBOutlet weak var watchview: UIView!
    
    @IBOutlet weak var imgView: UIView!
    @IBOutlet weak var imgview: UIImageView!
    @IBOutlet weak var namelbl: UILabel!
    @IBOutlet weak var usernamelbl: UILabel!
    @IBOutlet weak var btn: UIButton!
    @IBOutlet weak var RateView: UIView!
    @IBOutlet weak var sensorView: UIView!
    
    @IBOutlet weak var datelbl: UILabel!
    @IBOutlet weak var wtlbl: UILabel!
    @IBOutlet weak var htlbl: UILabel!
    
    @IBOutlet weak var logoutbtn: UIButton!
    @IBOutlet weak var genderlbl: UILabel!
   /* var receivedData : [String:String] = [:]
    var receivedImage : UIImage?*/
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        logoutbtn.layer.cornerRadius = 10
        logoutbtn.layer.masksToBounds = true
        logoutbtn.layer.borderWidth = 1
        logoutbtn.layer.borderColor = UIColor.systemGray.cgColor
        let defaults = UserDefaults.standard
        
        // Get current logged-in user's email
        guard let userEmail = defaults.string(forKey: "current_user_email") else { return }
        print(userEmail)

           // Load saved profile
           if let savedData = defaults.dictionary(forKey: "UserProfile_\(userEmail)") as? [String:String] {
               usernamelbl.text = savedData["field1"]
               namelbl.text = savedData["field2"]
               datelbl.text = savedData["field3"]
               genderlbl.text = savedData["field4"]
               htlbl.text = savedData["field5"]
               wtlbl.text = savedData["field6"]
           }
        
        // Load user-specific profile image
        if let imageData = defaults.data(forKey: "UserProfileImage_\(userEmail)"),
           let savedImage = UIImage(data: imageData) {
            imgview.image = savedImage
        } else {
            imgview.image = nil
        }
        
        // Your UI styling code
        let views = [watchview, RateView, sensorView]
        for view in views {
            view?.layer.cornerRadius = 20
            view?.layer.masksToBounds = true
            view?.layer.borderWidth = 1
            view?.layer.borderColor = UIColor.lightGray.cgColor
        }
        btn.layer.cornerRadius = 25
        btn.layer.masksToBounds = true
        imgView.layer.cornerRadius = 61
        imgView.layer.masksToBounds = true
    }
    @IBAction func editProfilebtn(_ sender: Any) {
        if let vc = storyboard?.instantiateViewController(identifier: "UpdateProfileVC") as? UpdateProfileVC {
            self.navigationController?.pushViewController(vc, animated: true)
        }
            
    }
    @IBAction func logoutBtn(_ sender: Any) {
        
        let defaults = UserDefaults.standard
        defaults.set(false, forKey: "isLoggedIn")
        defaults.removeObject(forKey: "current_user_email") // clear data
        defaults.synchronize()
       
        if let vc = self.storyboard?.instantiateViewController(identifier: "LoginVC") as? LoginVC {
            self.navigationController?.pushViewController(vc,animated: true)
        }
    }
}
