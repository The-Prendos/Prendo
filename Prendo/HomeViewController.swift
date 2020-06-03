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
    var tasks = [PFObject]()
    var check = false
    
    
    let filled_Star = UIImage(systemName: "star.fill")
     let unfilled_Star = UIImage(systemName: "star")
    
  
    
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
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        let query = PFQuery(className: "TaskList")
        query.includeKey("User")
        
        query.findObjectsInBackground() { (tasks, error) in
            if tasks != nil {
                self.tasks = tasks!
                self.tableView.reloadData()
            }
        }
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
    
   
 
 
    
  
      
    
    
    @IBAction func newTaskAdded(_ sender: Any) {
        
        
        rowCount += 1
        let task = PFObject(className: "TaskList")
        task["User"] = PFUser.current()
        task["Task"] = ""
        task["Favorited"] = false
        task["Completed"] = false
    
                       
                       
        task.saveInBackground() { (success, error) in
            if(success) { print("saved") }
            else { print("error") }
            }
        
        
       
        tableView.reloadData()
    }
    
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          return rowCount
      }
      
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskTableViewCell") as! TaskTableViewCell
        
        return cell
      }
      
    
    
 

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func onLogoutButton(_ sender: Any) {
        
        PFUser.logOut()
        
        let main = UIStoryboard(name: "Main", bundle: nil)
        let loginViewController = main.instantiateViewController(withIdentifier: "LoginViewController")
        
        let sceneDelegate = self.view.window?.windowScene?.delegate as! SceneDelegate
        
        sceneDelegate.window?.rootViewController = loginViewController
    }
    
}
