//
//  TaskEditingViewController.swift
//  Prendo
//
//  Created by Kevin Tang on 6/3/20.
//  Copyright © 2020 The Prendos. All rights reserved.
//

import UIKit

class TaskEditingViewController: UIViewController {
    
    
    
    
    @IBOutlet weak var titleTextField: UITextField!


    @IBOutlet weak var descriptionTextView: UITextView!
    
    override func viewDidLoad(  ) {
        super.viewDidLoad()
        
        descriptionTextView.text = "Explain to yourself why you want to complete this task..."
        descriptionTextView.textColor = UIColor.lightGray
        descriptionTextView!.layer.borderWidth = 1
        descriptionTextView!.layer.borderColor = UIColor.lightGray.cgColor

        // Do any additional setup after loading the view.
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            descriptionTextView.text = nil
            descriptionTextView.textColor = UIColor.black
        }
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
