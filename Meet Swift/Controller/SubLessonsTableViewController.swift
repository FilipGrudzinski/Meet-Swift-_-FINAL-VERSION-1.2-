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
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        applyTheme()
        tableView.reloadData()
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        applyTheme()
//        tableView.reloadData()
//    }
    
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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SubLessonsCell", for: indexPath) as! CustomSubLessonsCell
        //cell.backgroundColor = Theme.current.cellBackgroundColor
        //cell.imgUser.text = "LOLEK"
        cell.subLessonNumber.text = "\(indexPath.row + 1)."
        cell.subLessonTitle.text = subLessons[indexPath.row]
        cell.subLessonDescription.text = "Message \(indexPath.row)"
        cell.progressLabel.text = "OK"
        //cell.progressBar.progress = 1.0
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        lessonTitle = self.subLessons[indexPath.row]
        self.tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
//    func setTheme(isDark: Bool) {
//        
//        let theme = isDark ? ColorTheme.dark : ColorTheme.light
//        
//        view.backgroundColor = theme.viewControllerBackgroundColor
//        //UITableViewCell.appearance().backgroundColor = theme.cellBackgroundColor
//        
//        //selectedRow = theme.selectedRow
//        
//        
//    }
    
    private func applyTheme() {
        
        navigationController?.navigationBar.barStyle = Theme.current.style
        navigationController?.navigationBar.tintColor = Theme.current.buttonColor // color of navigationbar buttons
        navigationController?.navigationBar.barTintColor = Theme.current.navigationColor // color of navigationbar
        view.backgroundColor = Theme.current.viewControllerBackgroundColor
 
    }
    
}
