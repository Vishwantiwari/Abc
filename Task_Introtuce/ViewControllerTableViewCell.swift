//
//  ViewControllerTableViewCell.swift
//  Task_Introtuce
//
//  Created by Vishwan Tiwari on 13/05/21.
//

import UIKit


class ViewControllerTableViewCell: UITableViewCell {

    @IBOutlet weak var Firstname: UILabel!
    @IBOutlet weak var Lastname: UILabel!
    @IBOutlet weak var Gender: UILabel!
    @IBOutlet weak var Dob: UILabel!
    @IBOutlet weak var Hometown: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

