//
//  TaskTableViewCell.swift
//  Prendo
//
//  Created by Kevin Tang on 5/30/20.
//  Copyright © 2020 The Prendos. All rights reserved.
//

import UIKit
import Parse

class TaskTableViewCell: UITableViewCell {

        
    @IBOutlet weak var taskTitleLabel: UILabel!
   

    @IBOutlet weak var numLabel: UILabel!

    
    
    
    
        
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

       

    
   
}
