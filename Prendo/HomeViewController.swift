//
//  HomeViewController.swift
//  Prendo
//
//  Created by Kevin Tang on 5/30/20.
//  Copyright © 2020 The Prendos. All rights reserved.
//

import UIKit
import AlamofireImage
import Foundation
import Parse





class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
  
  
    

    var rowCount = 0
    var taskList = [String]()
    var check = false
    
    
    
  
    
    var currentTask = ""
    var currentRow = 0
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    


        tableView.dataSource = self
        tableView.delegate = self
        
    
        
        grabCurrentDate()
    
        // Do any additional setup after loading the view.
        tableView.reloadData()
        
       
    
    }
    
    
    func grabCurrentDate() {
                
          
          /* Get the current date.*/
          let currentDate = Date()
            
          /* Format the date style */
          let formatter = DateFormatter()
          
          
          /* Gather the date as a string */
          formatter.dateStyle = .long
          let dateString = formatter.string(from: currentDate)
          
          
          /* Gather the day as a string (i.e., monday, tuesday, ... sunday) */
          let day = formatter.weekdaySymbols[Calendar.current.component(.weekday, from: currentDate) - 1]
          
          dayLabel.text = day
          dateLabel.text = dateString
            
        }
    
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rowCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskTableViewCell", for: indexPath) as! TaskTableViewCell
        
        
        let task = cell.taskTextField.text
    

        
        
        if(task == "") {
            cell.taskTextField.isHidden = false
            cell.starbutton.isHidden = false
            cell.taskLabel.text = ""
        } else {
            cell.taskTextField.isHidden = true
            cell.taskLabel.isHidden = false
            cell.taskLabel.text = task
            
        }
        
        
    
    
    
        return cell
    }
    
    
    @IBAction func newTaskAdded(_ sender: Any) {
        rowCount += 1
        tableView.reloadData()
    }
    
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
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
