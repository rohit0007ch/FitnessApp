//
//  WorkoutTrackVC.swift
//  FitnessApp
//
//  Created by ROHIT on 04/08/25.
//

import UIKit

class WorkoutTrackVC: UIViewController {

    @IBOutlet weak var v1: UIView!
    
    @IBOutlet weak var powerview: UIView!
    @IBOutlet weak var pview: UIView!
    @IBOutlet weak var v3: UIView!
    @IBOutlet weak var v2: UIView!
    @IBOutlet weak var myview: UIView!
    
    @IBOutlet weak var mview: UIView!
    @IBOutlet weak var hview: UIView!
    @IBOutlet weak var timerlbl: UILabel!
    
    @IBOutlet weak var tview: UIView!
    @IBOutlet weak var btnlbl: UIButton!
    var time = 0.0
    var timer = Timer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myview.layer.cornerRadius = 25
        myview.layer.masksToBounds = true
        myview.layer.borderWidth = 1
        myview.layer.borderColor = UIColor.lightGray.cgColor
        
        tview.layer.cornerRadius = 146
        
        tview.layer.masksToBounds = true
        
        v1.layer.cornerRadius = 20
        v1.layer.masksToBounds = true
        v1.layer.borderWidth = 1
        v1.layer.borderColor = UIColor.lightGray.cgColor
        v2.layer.cornerRadius = 20
        v2.layer.masksToBounds = true
        v2.layer.borderWidth = 1
        v2.layer.borderColor = UIColor.lightGray.cgColor
        v3.layer.cornerRadius = 20
        v3.layer.masksToBounds = true
        v3.layer.borderWidth = 1
        v3.layer.borderColor = UIColor.lightGray.cgColor
        mview.layer.cornerRadius = 25
        mview.layer.masksToBounds = true
        mview.layer.borderWidth = 1
        mview.layer.borderColor = UIColor.lightGray.cgColor
        pview.layer.cornerRadius = 25
        pview.layer.masksToBounds = true
        pview.layer.borderWidth = 1
        pview.layer.borderColor = UIColor.lightGray.cgColor
        
        powerview.layer.cornerRadius = 25
        powerview.layer.masksToBounds = true
        powerview.layer.borderWidth = 1
        powerview.layer.borderColor = UIColor.lightGray.cgColor
        hview.layer.cornerRadius = 25
        hview.layer.masksToBounds = true
        hview.layer.borderWidth = 1
        hview.layer.borderColor = UIColor.lightGray.cgColor
        
    }
    
    @IBAction func startbtn(_ sender: UIButton) {
        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(WorkoutTrackVC.startAction), userInfo: nil, repeats: true)
    }
    @objc func startAction () {
        time += 0.2
        timerlbl.text = "\(time)"
         
    }
}
