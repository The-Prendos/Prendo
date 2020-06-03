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

        

    @IBOutlet weak var taskTextField: UITextField!
    @IBOutlet weak var completionButton: UIButton!
    @IBOutlet weak var locationButton: UIButton!
    @IBOutlet weak var starbutton: UIButton!
    
    var completed:Bool = false
    var favorited:Bool = false
    var theOID:String = ""
   
    let filled_Star = UIImage(systemName: "star.fill")
    let unfilled_Star = UIImage(systemName: "star")
    
  
   
    @IBAction func taskCompletionAction(_ sender: Any) {
        
       
        if(completionButton.backgroundColor == UIColor(red: 0.00, green: 0.42, blue: 0.46, alpha: 1.00)) {
                completionButton.backgroundColor = UIColor.lightGray
                completed = false
        } else {
                completionButton.backgroundColor = UIColor(red: 0.00, green: 0.42, blue: 0.46, alpha: 1.00)
                completed = true
        }
        
    }
    
    
    @IBAction func favoriteAction(_ sender: Any) {
    
        let toBeFavorited = !favorited
                   
        if(toBeFavorited) {
            self.setFavorite(true)
        } else {
            self.setFavorite(false)
        }
          
      }
    
    
     func setFavorite(_ isFavorited:Bool) {
        
              favorited = isFavorited
        
              if(favorited) { starbutton.setImage(filled_Star, for: UIControl.State.normal) }
                
              else { starbutton.setImage(unfilled_Star, for: UIControl.State.normal) }
        
        
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
