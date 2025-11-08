//
//  TableViewCell.swift
//  FitnessApp
//
//  Created by ROHIT on 31/07/25.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var mview: UIView!
    @IBOutlet weak var btn: UIButton!
    @IBOutlet weak var lblview: UILabel!
    @IBOutlet weak var view: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        mview.layer.cornerRadius = 25
        mview.layer.masksToBounds = true
        mview.layer.borderWidth = 1.0
        mview.layer.borderColor = UIColor.gray.cgColor
        btn.layer.cornerRadius = 15
        btn.layer.masksToBounds = true
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        view.layer.borderWidth = 0.5
        view.layer.borderColor = UIColor.gray.cgColor
    }
    
}
