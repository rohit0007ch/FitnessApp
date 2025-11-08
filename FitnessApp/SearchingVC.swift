//
//  SearchingVC.swift
//  FitnessApp
//
//  Created by ROHIT on 05/08/25.
//

import UIKit

class SearchingVC: UIViewController {
    
   @IBOutlet weak var bview: UIView!
    @IBOutlet weak var aview: UIView!
    @IBOutlet weak var myview: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        bview.layer.cornerRadius = 20
        bview.layer.masksToBounds = true
        bview.layer.borderWidth = 1
        bview.layer.borderColor = UIColor.lightGray.cgColor
        
        aview.layer.cornerRadius = 20
        aview.layer.masksToBounds = true
        aview.layer.borderWidth = 1
        aview.layer.borderColor = UIColor.lightGray.cgColor
        myview.layer.cornerRadius = 20
        myview.layer.masksToBounds = true
        myview.layer.borderWidth = 1
        myview.layer.borderColor = UIColor.lightGray.cgColor

    }
    


}
