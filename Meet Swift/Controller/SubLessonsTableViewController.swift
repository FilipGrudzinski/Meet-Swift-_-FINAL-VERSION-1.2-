//
//  SubLessonsTableViewController.swift
//  Meet Swift
//
//  Created by Filip on 10/12/2018.
//  Copyright © 2018 Filip. All rights reserved.
//

import UIKit

var subLessonsTitle = ""

class SubLessonsTableViewController: UITableViewController {

    var subLessons = ["SubLesson 1", "SubLesson 2", "SubLesson 3", "SubLesson 4", "SubLesson 5", "SubLesson 6", "SubLesson 7", "SubLesson 8", "SubLesson 9", "SubLesson 10", "SubLesson 11", "SubLesson 12", "SubLesson 13", "SubLesson 14", "SubLesson 152",]
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.title = subLessonsTitle
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44
     
    
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
  
        return subLessons.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        let cell = tableView.dequeueReusableCell(withIdentifier: "SubLessonsCell", for: indexPath)
//
//        let headerLabel = UILabel()
//        headerLabel.text = subLessons[indexPath.row]
//        headerLabel.frame = CGRect(x: 15, y: 5, width: 100, height: 35)
//        headerLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
//
//        //let name = subLessons[indexPath.row]
//        view.addSubview(headerLabel)
//        //cell.textLabel?.text = name
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SubLessonsCell", for: indexPath) as! CustomSubLessonsTableViewCell
        
        cell.labUerName.text = subLessons[indexPath.row]
        cell.labMessage.text = "Message \(indexPath.row)"
        cell.labTime.text = DateFormatter.localizedString(from: NSDate() as Date, dateStyle: .short, timeStyle: .short)
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        lessonTitle = self.subLessons[indexPath.row]
        
    }
    

}
