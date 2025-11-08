//
//  PastSessionVC.swift
//  FitnessApp
//
//  Created by ROHIT on 06/08/25.
//

import UIKit

class PastSessionVC: UIViewController {
    @IBOutlet weak var v1: UIView!
    
    @IBOutlet weak var a3: UIView!
    @IBOutlet weak var a2: UIView!
    @IBOutlet weak var a1: UIView!
    @IBOutlet weak var v4: UIView!
    @IBOutlet weak var v3: UIView!
    @IBOutlet weak var v2: UIView!
    @IBOutlet weak var myview: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        myview.layer.cornerRadius = 20
        myview.layer.masksToBounds = true
        myview.layer.borderWidth = 1
        myview.layer.borderColor = UIColor.lightGray.cgColor
        setupViewStyles()
    }
    
    
    
    func setupViewStyles() {
        let views = [v1, v2, v3, v4,a1,a2,a3]
        
        for view in views {
            view?.layer.cornerRadius = 20   // corner radius
            view?.layer.masksToBounds = true
            view?.layer.borderWidth = 1        // border width
            view?.layer.borderColor = UIColor.gray.cgColor // border color
            view?.clipsToBounds = true
        }
    }
}
