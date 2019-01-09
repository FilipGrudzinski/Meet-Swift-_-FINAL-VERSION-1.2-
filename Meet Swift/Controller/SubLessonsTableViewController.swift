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

    var subLessons = ["SubLesson 111111111111111111", "SubLesson 2", "SubLesson 3", "SubLesson 4", "SubLesson 5", "SubLesson 6", "SubLesson 7", "SubLesson 8", "SubLesson 9", "SubLesson 10", "SubLesson 11", "SubLesson 12", "SubLesson 13", "SubLesson 14", "SubLesson 152",]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = subLessonsTitle
    
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return subLessons.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SubLessonsCell", for: indexPath)
        
        let name = subLessons[indexPath.row]
        
        cell.textLabel?.text = name
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        lessonTitle = self.subLessons[indexPath.row]
        
    }
    

}
