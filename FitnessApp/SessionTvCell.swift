//
//  SessionTvCell.swift
//  FitnessApp
//
//  Created by ROHIT on 06/08/25.
//

import UIKit

class SessionTvCell: UITableViewCell {

    @IBOutlet weak var view: UIView!
    @IBOutlet weak var lbl1: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet weak var lbl2: UILabel!
    @IBOutlet weak var imgview: UIImageView!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        view.layer.cornerRadius = 15
        view.layer.masksToBounds = true
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.lightGray.cgColor
        
    }
  
}
