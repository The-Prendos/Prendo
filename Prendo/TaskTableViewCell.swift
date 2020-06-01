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
    @IBOutlet weak var completionButton: UIButton!
    

    @IBOutlet weak var starbutton: UIButton!
    

    
    let filled_Star = UIImage(systemName: "star.fill")
    let unfilled_Star = UIImage(systemName: "star")
    var favorited:Bool = false
    
    
    @IBAction func taskCompletionAction(_ sender: Any) {
        
        if(completionButton.backgroundColor == UIColor(red: 0.00, green: 0.42, blue: 0.46, alpha: 1.00)) {
                completionButton.backgroundColor = UIColor.lightGray
        } else {
                completionButton.backgroundColor = UIColor(red: 0.00, green: 0.42, blue: 0.46, alpha: 1.00)
        }
        

       
    }
    
    
    @IBAction func favoriteAction(_ sender: Any) {
        
        
        if(!favorited) {
            starbutton.setImage(filled_Star, for: UIControl.State.normal)
            favorited = true
        } else {
            starbutton.setImage(unfilled_Star, for: UIControl.State.normal)
            favorited = false
        }
      
        
      }
    
    
     
    
    
    
  
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
   
}
