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
    
    
    var done: Bool = true
    var subLessons = ["SubLesson 1", "SubLesson 2", "SubLesson 3", "SubLesson 4", "SubLesson 5", "SubLesson 6", "SubLesson 7", "SubLesson 8", "SubLesson 9", "SubLesson 10", "SubLesson 11", "SubLesson 12", "SubLesson 13", "SubLesson 14", "SubLesson 152",]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = subLessonsTitle
        tableView.separatorStyle = .none
        view.backgroundColor = Theme.current.viewControllerBackgroundColor
        
        
    }
    
    // MARK: - TableView Row settings
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subLessons.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SubLessonsCell", for: indexPath) as! CustomSubLessonsCell
        
        cell.backgroundColor = Theme.current.cellBackgroundColor
        cell.subLessonsNumber.textColor = Theme.current.textColor
        cell.subLessonsTitle.textColor = Theme.current.textColor
        cell.subLessonsDescription.textColor = Theme.current.textColor
        cell.tintColor = Theme.current.buttonColor
        
        let backgroundView = UIView()
        backgroundView.backgroundColor = Theme.current.selectedRow
        cell.selectedBackgroundView = backgroundView
        
        cell.subLessonsNumber.text = "\(indexPath.row + 1)."
        cell.subLessonsTitle.text = subLessons[indexPath.row]
        cell.subLessonsDescription.text = "Message \(indexPath.row) dsadasdasdadadadasda"
        cell.accessoryType = self.done ? .checkmark : .none
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        lessonTitle = self.subLessons[indexPath.row]
        self.tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}
