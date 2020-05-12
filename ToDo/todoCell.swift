//
//  todoCell.swift
//  ToDo
//
//  Created by MACBOOK on 12/05/20.
//  Copyright © 2020 SukhmaniKaur. All rights reserved.
//

import UIKit

class todoCell: UITableViewCell {

    @IBOutlet weak var countLbl: UILabel!
    @IBOutlet weak var taskLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
