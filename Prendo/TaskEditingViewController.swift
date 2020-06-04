//
//  TaskEditingViewController.swift
//  Prendo
//
//  Created by Kevin Tang on 6/3/20.
//  Copyright © 2020 The Prendos. All rights reserved.
//

import UIKit
import Parse

class TaskEditingViewController: UIViewController,UITextViewDelegate{
    
    
    
    let filled_Star = UIImage(systemName: "star.fill")
    let unfilled_Star = UIImage(systemName: "star")
    var favorited:Bool = false
    
    
     
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var starButton: UIButton!
    @IBOutlet weak var earthButton: UIButton!
    

    override func viewDidLoad(  ) {
        super.viewDidLoad()
        
        descriptionTextView.delegate = self
        
        descriptionTextView.text = "Explain to yourself why you want to complete this task..."
        descriptionTextView.textColor = UIColor.lightGray
        
        
        descriptionTextView!.layer.borderWidth = 1
        descriptionTextView!.layer.borderColor = UIColor.lightGray.cgColor

        // Do any additional setup after loading the view.
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        
        if descriptionTextView.textColor == UIColor.lightGray {
            descriptionTextView.text = nil
            descriptionTextView.textColor = UIColor.black
            
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Explain to yourself why you want to complete this task.."
            textView.textColor = UIColor.lightGray
        }
    }
    
    
    @IBAction func onTap(_ sender: Any) {
        
        view.endEditing(true)
    }
    
    
    
    @IBAction func favoriteAction(_ sender: Any) {
    
        let toBeFavorited = !favorited
                   
        if(toBeFavorited) {
            self.setFavorite(true)
        } else {
            self.setFavorite(false)
        }
          
      }
    
    @IBAction func onSubmitButton(_ sender: Any) {
        
        let task = PFObject(className: "TaskList")
               
        task["Task"] = titleTextField.text!
        task["User"] = PFUser.current()!
        task["Location"] = locationTextField.text!
        task["Favorited"] = favorited
        task["Completed"] = false
        task["Description"] = descriptionTextView.text!
               
        task.saveInBackground { (success, error) in
                   if success {
                       self.dismiss(animated: true, completion: nil)
                       print ("saved!")
                        
                   }
                   else { print("error!") }
               }
                       
               
    }
    
     func setFavorite(_ isFavorited:Bool) {
        
              favorited = isFavorited
        
              if(favorited) { starButton.setImage(filled_Star, for: UIControl.State.normal) }
                
              else { starButton.setImage(unfilled_Star, for: UIControl.State.normal) }
        
        
          }
    

    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
