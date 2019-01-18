//
//  SubLessonsTableViewController.swift
//  Meet Swift
//
//  Created by Filip on 10/12/2018.
//  Copyright © 2018 Filip. All rights reserved.
//

import UIKit
import RealmSwift


var subLessonsTitle = ""
var indexPathsInSublessons: [Int] = []


class SubLessonsTableViewController: UITableViewController {
    
     lazy var realm = try! Realm()
    
     var toDoItems: Results<LessonsData>!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(indexPathsInSublessons)
        self.title = subLessonsTitle
        loadItems()
        tableView.separatorStyle = .none
        view.backgroundColor = Theme.current.viewControllerBackgroundColor
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)
    }
    
    
    func loadItems() {
        
        toDoItems = realm.objects(LessonsData.self)
        
        
        tableView.reloadData()
        
    }
    
    
    // MARK: - TableView Row settings
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return rozdzialy[indexPathsInSublessons[0]].lessonsData[indexPathsInSublessons[1]].subLessonsData.count
        return toDoItems[indexPathsInSublessons[0]].subLessons.count
        
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
        //cell.subLessonsTitle.text = rozdzialy[indexPathsInSublessons[0]].lessonsData[indexPathsInSublessons[1]].subLessonsData[indexPath.row].subLessonsTitle
        
        cell.subLessonsTitle.text = toDoItems[indexPathsInSublessons[0]].subLessons[indexPath.row].subLessonsTitle
        cell.subLessonsDescription.text = toDoItems[indexPathsInSublessons[0]].subLessons[indexPath.row].subLessonsTitleDescription
        cell.accessoryType = toDoItems[indexPathsInSublessons[0]].subLessons[indexPath.row].completion ? .checkmark : .none
        //cell.subLessonsDescription.text = rozdzialy[indexPathsInSublessons[0]].lessonsData[indexPathsInSublessons[1]].subLessonsData[indexPath.row].subLessonsTitleDescription
       // cell.accessoryType = rozdzialy[indexPathsInSublessons[0]].lessonsData[indexPathsInSublessons[1]].subLessonsData[indexPath.row].completion ? .checkmark : .none
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        let lessonTitle = rozdzialy[indexPathsInSublessons[0]].lessonsData[indexPathsInSublessons[1]].subLessonsData[indexPath.row].subLessonsTitle
//        self.tableView.deselectRow(at: indexPath, animated: true)
//        
//        let type = rozdzialy[indexPathsInSublessons[0]].lessonsData[indexPathsInSublessons[1]].subLessonsData[indexPath.row].typeOfTask
//        
//        if type == "A" {
//            lessonATitle = lessonTitle
//            performSegue(withIdentifier: "goToSubLessonsA", sender: self)
//            
//        } else {
//            lessonBTitle = lessonTitle
//             performSegue(withIdentifier: "goToSubLessonsB", sender: self)
//            
//        }
   
    }
    
    
}
