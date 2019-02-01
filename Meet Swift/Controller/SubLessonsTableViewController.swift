//
//  SubLessonsTableViewController.swift
//  Meet Swift
//
//  Created by Filip on 10/12/2018.
//  Copyright © 2018 Filip. All rights reserved.
//

import UIKit
import RealmSwift




class SubLessonsTableViewController: UITableViewController {
    
    
    lazy var realm = try! Realm()
    var resultsSubLessons: Results<CollectionOfLessons>!
    var indexesToSublessons = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadItems()
        
        tableView.separatorStyle = .none
        view.backgroundColor = Theme.current.viewControllerBackgroundColor
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        loadItems()
        setSubLessonsNavBar()
        tableView.reloadData()
        
      
    }
    
    // MARK: - TableView Row settings
  
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultsSubLessons[indexesToSublessons[0]].lessons[indexesToSublessons[1]].subLessons.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SubLessonsCell", for: indexPath) as! CustomSubLessonsCell
        
        let cellResults = resultsSubLessons[indexesToSublessons[0]].lessons[indexesToSublessons[1]].subLessons[indexPath.row]
        
        cell.backgroundColor = Theme.current.cellBackgroundColor
        cell.subLessonsNumber.textColor = Theme.current.textColor
        cell.subLessonsTitle.textColor = Theme.current.textColor
        cell.subLessonsDescription.textColor = Theme.current.textColor
        cell.tintColor = Theme.current.buttonColor
        
        let backgroundView = UIView()
        backgroundView.backgroundColor = Theme.current.selectedRow
        cell.selectedBackgroundView = backgroundView
        
        cell.subLessonsNumber.text = "\(indexPath.row + 1)."
        cell.subLessonsTitle.text = cellResults.subLessonsTitle
        cell.subLessonsDescription.text = cellResults.subLessonsTitleDescription
        cell.accessoryType = cellResults.completion ? .checkmark : .none
        
        return cell
        
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = resultsSubLessons[indexesToSublessons[0]].lessons[indexesToSublessons[1]].subLessons[indexPath.row].typeOfTask
        
        if type == "A" || type == "B" {
            performSegue(withIdentifier: "goToLesson", sender: self)
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "goToLesson" {

            let lessonAVC = segue.destination as! LessonViewController
            for n in indexesToSublessons { lessonAVC.indexesLesson.append(indexesToSublessons[n]) }
            lessonAVC.indexesLesson.append(self.tableView!.indexPathForSelectedRow!.row)
            print(lessonAVC.indexesLesson)
        }
    }
    
    
    
    // MARK: - LoadRealm function
    
    private func loadItems() {
        
        resultsSubLessons = realm.objects(CollectionOfLessons.self)
        tableView.reloadData()
        
    }
    
    
}


extension SubLessonsTableViewController {
    
    private func setSubLessonsNavBar() {
        
        let reusableResults = resultsSubLessons[indexesToSublessons[0]].lessons[indexesToSublessons[1]]
        
        var sumOfDoneLessonsInSection = 0
        for n in 0..<reusableResults.subLessons.count { if reusableResults.subLessons[n].completion == true { sumOfDoneLessonsInSection += 1 } }
        
        navigationItem.title = "\(resultsSubLessons[indexesToSublessons[0]].lessons[indexesToSublessons[1]].title)"
        
        let rightBtt = UIButton(type: .system)
        rightBtt.isUserInteractionEnabled = false
        rightBtt.tintColor = Theme.current.textColor
        rightBtt.setTitle("\(sumOfDoneLessonsInSection)/\(reusableResults.subLessons.count)", for: .normal)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightBtt)
        
    }
    
}
