//
//  LessonsTableViewController.swift
//  Meet Swift
//
//  Created by Filip on 10/12/2018.
//  Copyright © 2018 Filip. All rights reserved.
//

import UIKit

class LessonsTableViewController: UITableViewController {
    
    let sections = ["Beginner", "Intermediate", "Advanced"]
    let sections1 = ["232", "32323","sekcja 1"]
    let sections2 = ["fdfd232", "32323fdfd","sekcja 2"]
    let sections3 = ["2sda32", "3232fdfd3","sekcja 3"]
      //var beginner = BeginnerLessonsBank()
    //    var intermediate = IntermediateLessonsBank()
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //print(lessons.list)
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return sections.count
        
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return sections[section]
        
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        
        return sections.count
        
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
      
        let cell = tableView.dequeueReusableCell(withIdentifier: "LessonsCell", for: indexPath)
        
        //let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "LessonsCell")
        if indexPath.section == 0 {
            
            let name = sections1[indexPath.row]
            
            cell.textLabel?.text = name
            
        } else if indexPath.section == 1 {
            
            let name = sections2[indexPath.row]
            
            cell.textLabel?.text = name
            
            
        } else if indexPath.section == 2 {
            
            let name = sections3[indexPath.row]
            
            cell.textLabel?.text = name
            
        }
     
        
        
        
        
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        //subTitle = self.lessons.list[indexPath.row].lessonText
        performSegue(withIdentifier: "goToSubLessonsView", sender: nil)
        
        
        
    }
    
    
}
