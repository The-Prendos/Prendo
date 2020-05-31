//
//  TaskTableViewCell.swift
//  Prendo
//
//  Created by Kevin Tang on 5/30/20.
//  Copyright © 2020 The Prendos. All rights reserved.
//

import UIKit

class TaskTableViewCell: UITableViewCell {

        

    @IBOutlet weak var taskTextField: UITextField!
    
    @IBOutlet weak var taskLabel: UILabel!
    
    @IBOutlet weak var taskEditingFinished: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
   
}
