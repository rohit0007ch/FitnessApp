//
//  SessionVC.swift
//  FitnessApp
//
//  Created by ROHIT on 06/08/25.
//

import UIKit

class SessionVC: UIViewController,UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mycell", for: indexPath) 
        return cell
    }

    

    @IBOutlet weak var tblview: UITableView!
    
    @IBOutlet weak var filterbtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        tblview.delegate = self
        tblview.dataSource = self
        let nib = UINib(nibName: "SessionTvCell", bundle: nil)
        tblview.register(nib, forCellReuseIdentifier: "mycell")
        // Do any additional setup after loading the view.
        filterbtn.layer.cornerRadius = 18
        filterbtn.layer.masksToBounds = true
    }
    

  

}
