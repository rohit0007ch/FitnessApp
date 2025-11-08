//
//  LeaderBoardVC.swift
//  FitnessApp
//
//  Created by ROHIT on 28/08/25.
//

import UIKit

class LeaderBoardVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as!LeaderBoardTvCell
           return cell
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "LeaderBoardTvCell", bundle: nil)
           tableView.register(nib, forCellReuseIdentifier: "cell")
           
           tableView.delegate = self
           tableView.dataSource = self
    }
    

    
}
