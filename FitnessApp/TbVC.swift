//
//  TbVC.swift
//  FitnessApp
//
//  Created by ROHIT on 02/08/25.
//

import UIKit

class TbVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
  
    

    @IBOutlet weak var tblview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Schedule Workouts"
        self.navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.white,
            
                .font: UIFont.systemFont(ofSize: 24, weight: .semibold)
        ]
        
        tblview.delegate = self
        tblview.dataSource = self
        let nib = UINib(nibName: "TableViewCell", bundle: nil)
        tblview.register(nib, forCellReuseIdentifier: "TableViewCell")
      
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblview.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        return cell
    }
    

}
