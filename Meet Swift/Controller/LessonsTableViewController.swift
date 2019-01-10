//
//  LessonsTableViewController.swift
//  Meet Swift
//
//  Created by Filip on 10/12/2018.
//  Copyright © 2018 Filip. All rights reserved.
//

import UIKit

class LessonsTableViewController: UITableViewController{
    
    
    var isDefaultStatusBar = true
    //var cellColor = UIColor()
    
    let sections = ["Beginner", "Intermediate", "Advanced"]
    let sections0 = BeginnerLessonsBank()
    let sections1 = IntermediateLessonsBank()
    let sections2 = ["2sda32", "3232fdfd3","sekcja 3"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "LessonsCell", bundle: nil), forCellReuseIdentifier: "customLessonsCell")
        self.title = "Meet Swift"
        //setTheme(isDark: false)
        
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
        
        if section == 0 {
            
            return sections0.list.count
            
        } else if section == 1 {
            
            return sections1.list.count
            
            
        } else if section == 2 {
            
            return sections2.count
            
        }
        return 0
        
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "customLessonsCell", for: indexPath) as! CustomLessonsCell
        //let cell = tableView.dequeueReusableCell(withIdentifier: "LessonsCell", for: indexPath)
        //let color = cellColor
        //cell.backgroundColor = color
        //let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "LessonsCell")
        if indexPath.section == 0 {
            
            cell.lessonsNumberLabel.text = "\(indexPath.row + 1)."
            cell.lessonsTitleLabel.text = sections0.list[indexPath.row].lessonText
            cell.progressBar.progress = 0.0
            cell.lessonsProgressLabel.text = "1/20"
       
            
        } else if indexPath.section == 1 {
            
            cell.lessonsNumberLabel.text = "\(indexPath.row + 1)."
            cell.lessonsTitleLabel.text = sections1.list[indexPath.row].lessonText
            cell.progressBar.progress = 0.1
            cell.lessonsProgressLabel.text = "1/20"
           
            
        } else if indexPath.section == 2 {
            
            cell.lessonsNumberLabel.text = "\(indexPath.row + 1)."
            cell.lessonsTitleLabel.text = sections1.list[indexPath.row].lessonText
            cell.progressBar.progress = 0.1
            cell.lessonsProgressLabel.text = "1/20"
         
        }
        
        return cell
    }
    

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "goToSubLessonsView", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destinationVC = segue.destination as! SubLessonsTableViewController
        
//        if let indexPath = tableView.indexPathForSelectedRow {
//            
//            destinationVC.selectedCategory = categories?[indexPath.row]
//            
//        }
        
    }
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//        if indexPath.section == 0 {
//            
//            let name = sections0.list[indexPath.row].lessonText
//
//            subLessonsTitle = name
//
//        } else if indexPath.section == 1 {
//
//            let name = sections1.list[indexPath.row].lessonText
//
//            subLessonsTitle = name
//            
//
//        } else if indexPath.section == 2 {
//
//            let name = sections2[indexPath.row]
//
//            subLessonsTitle = name
//
//        }
//
//    }
    
    
    
}
//
//extension LessonsTableViewController {
//
//    func setTheme(isDark: Bool) {
//
//        let theme = isDark ? ColorTheme.dark : ColorTheme.light
//
//        //view.backgroundColor = theme.viewControllerBackgroundColor
//
//        navigationController?.navigationBar.barTintColor = theme.primaryColor
//        navigationController?.navigationBar.tintColor =  theme.primaryTextColor
//        cellColor = theme.cellColor
//
//        isDefaultStatusBar = theme.isDefaultStatusBar
//
//        if isDefaultStatusBar {
//
//            navigationController?.navigationBar.barStyle = .default
//
//
//        } else {
//
//            navigationController?.navigationBar.barStyle = .blackOpaque
//
//        }
//
//        tableView.reloadData()
//    }
//
//
//}
