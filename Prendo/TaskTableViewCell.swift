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
    @IBOutlet weak var completionButton: UIButton!

    
    var completed:Bool = false
    var theOID:String = ""
    
    func setCompleted(_ isCompleted:Bool) {
           
                 completed = isCompleted
           
                 if(completed) {
                    
                    completionButton.backgroundColor = UIColor(red: 0.00, green: 0.42, blue: 0.46, alpha: 1.00)
                    
                 }
                    
                 else {
                    
                     completionButton.backgroundColor = UIColor.lightGray
                    
                }
           
           
             }
    
    @IBAction func taskCompletionAction(_ sender: Any) {
        
        let toBeCompleted = !completed
        
        if(toBeCompleted) {
            
            self.setCompleted(true)
            
           let query = PFQuery(className:"TaskList")
            query.getObjectInBackground(withId: theOID) { (object: PFObject?, error: Error?) in
                if let error = error {
                    print("completion did not work")
                } else if let object = object {
                    object["Completed"] = true
                    
                    object.saveInBackground()
                    
                }
            }

            
        }
        
        else {
            
            self.setCompleted(false)
            
            let query = PFQuery(className:"TaskList")
            query.getObjectInBackground(withId: theOID) { (object: PFObject?, error: Error?) in
                if let error = error {
                    print("Incompletion did not work")
                } else if let  object = object {
                    object["Completed"] = false
                    
                    object.saveInBackground()
                   
                }
            }
          
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
