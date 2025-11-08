//
//  ActivityVC.swift
//  FitnessApp
//
//  Created by ROHIT on 31/07/25.
//

import UIKit

class ActivityVC: UIViewController {
    
    @IBOutlet weak var oview: UIView!
    @IBOutlet weak var profileview: UIView!
    
    @IBOutlet weak var lbl: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var tview: UIView!
    @IBOutlet weak var joinbutton: UIButton!
    @IBOutlet weak var twoview: UIView!
    @IBOutlet weak var Joinbtn: UIButton!
    @IBOutlet weak var oneview: UIView!
    @IBOutlet weak var Avgview: UIView!
    @IBOutlet weak var Punchview: UIView!
    @IBOutlet weak var LeaderboardView: UIView!
    @IBOutlet weak var WorkoutView: UIView!
    @IBOutlet weak var ProgressView: UIView!
    
    var receivedImage : UIImage!
    var receivedText : String!
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = UserDefaults.standard
          // Always get the logged-in user
          guard let userEmail = defaults.string(forKey: "current_user_email") else { return }
          
          // Load the correct profile dictionary
          if let profileData = defaults.dictionary(forKey: "UserProfile_\(userEmail)") as? [String:String] {
              lbl.text = profileData["field2"] // Or use "name" if you want name, adjust as needed
          }
          
          // Load the correct profile image for this user
          if let imageData = defaults.data(forKey: "UserProfileImage_\(userEmail)"),
             let savedImage = UIImage(data:imageData) {
              imageView.image = savedImage
          } else {
              imageView.image = nil
          }
          
        
        navigationItem.hidesBackButton = true
        
      
        profileview.layer.cornerRadius = 38
        profileview.layer.masksToBounds = true
        // progress view
        ProgressView.layer.cornerRadius = 16
        ProgressView.layer.masksToBounds = true
        ProgressView.layer.borderWidth = 1.0
        ProgressView.layer.borderColor = UIColor.gray.cgColor
        // workoutview
        WorkoutView.layer.cornerRadius = 28
        WorkoutView.layer.masksToBounds = true
        WorkoutView.layer.borderWidth = 1.0
        WorkoutView.layer.borderColor = UIColor.gray.cgColor
        //leaderboardview
        LeaderboardView.layer.cornerRadius = 28
        LeaderboardView.layer.masksToBounds = true
        LeaderboardView.layer.borderWidth = 1.0
        LeaderboardView.layer.borderColor = UIColor.gray.cgColor
        // Punchview
        Punchview.layer.cornerRadius = 28
        Punchview.layer.masksToBounds = true
        Punchview.layer.borderWidth = 1.0
        Punchview.layer.borderColor = UIColor.gray.cgColor
        // Avg View
        Avgview.layer.cornerRadius = 28
        Avgview.layer.masksToBounds = true
        Avgview.layer.borderWidth = 1.0
        Avgview.layer.borderColor = UIColor.gray.cgColor
        
        
        oneview.layer.cornerRadius = 10
        oneview.layer.masksToBounds = true
        
        Joinbtn.layer.cornerRadius = 18
        Joinbtn.layer.masksToBounds = true

        joinbutton.layer.cornerRadius = 18
        joinbutton.clipsToBounds = true
        
        twoview.layer.cornerRadius = 10
        twoview.layer.masksToBounds = true
        
        oview.layer.cornerRadius = 28
        oview.layer.masksToBounds = true
        oview.layer.borderWidth = 1.0
        oview.layer.borderColor = UIColor.gray.cgColor
        
        tview.layer.cornerRadius = 28
        tview.layer.masksToBounds = true
        tview.layer.borderWidth = 1.0
        tview.layer.borderColor = UIColor.gray.cgColor
        
        
    }
    @IBAction func viewbtn(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(identifier: "TbVC") as! TbVC
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
}
