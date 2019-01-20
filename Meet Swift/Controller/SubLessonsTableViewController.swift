//
//  SubLessonsTableViewController.swift
//  Meet Swift
//
//  Created by Filip on 10/12/2018.
//  Copyright © 2018 Filip. All rights reserved.
//

import UIKit
import RealmSwift



var indexesToSublessons = [Int]()


class SubLessonsTableViewController: UITableViewController {
    
    lazy var realm = try! Realm()
    
    var resultsSubLessons: Results<CollectionOfLessons>!
    var resultsLessonsInSublessons: Results<LessonsData>!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Indexy po przejsci do 2 okranu \(indexesToSublessons)")
        loadItems()
        //self.title = resultsSubLessons?[indexesToSublessons[0]].title
        //self.title = resultsSubLessons[indexesToSublessons[0]].lessons[indexesToSublessons[1]].title
      
        let sumOfLessonsInSection = resultsLessonsInSublessons[indexesToSublessons[0]].subLessons.count
        var sumOfDoneLessonsInSection = 0
        
        for subLessons in 0..<sumOfLessonsInSection {
           
            if resultsLessonsInSublessons[indexesToSublessons[0]].subLessons[subLessons].completion == true {
                
                sumOfDoneLessonsInSection += 1
                
            }
            
            
        }
        func setTitle(title:String, subtitle:String) -> UIView {
            let titleLabel = UILabel(frame: CGRect(x:0, y:4, width:0, height:0))
            
            titleLabel.textColor = Theme.current.textColor
            titleLabel.font = UIFont.boldSystemFont(ofSize: 17)
            titleLabel.text = title
            titleLabel.sizeToFit()
            
            
            let subtitleLabel = UILabel(frame: CGRect(x: UIScreen.main.bounds.width/2  , y: 5, width:40, height:30))
          
            
            subtitleLabel.textColor = Theme.current.textColor
            subtitleLabel.font = UIFont.systemFont(ofSize: 16.0)
            subtitleLabel.text = subtitle
            subtitleLabel.textAlignment = .left
            subtitleLabel.sizeToFit()
            
            let titleView = UIView(frame: CGRect(x:0, y:0, width:max(titleLabel.frame.size.width, subtitleLabel.frame.size.width), height:30))
            titleView.addSubview(titleLabel)
            titleView.addSubview(subtitleLabel)
            

            
            return titleView
        }
        
        self.navigationItem.titleView = setTitle(title: "\(resultsSubLessons[indexesToSublessons[0]].lessons[indexesToSublessons[1]].title)", subtitle: "0/20")
        
//        let rightBarButtonItem: UIBarButtonItem = {
//            let barButtonItem = UIBarButtonItem(title: "\(sumOfDoneLessonsInSection)/\(resultsLessonsInSublessons[indexesToSublessons[1]].subLessons.count)", style: .plain , target: nil, action: nil)
//            barButtonItem.tintColor = Theme.current.textColor
//            return barButtonItem
//        }()
//
//        self.navigationItem.rightBarButtonItem = rightBarButtonItem
        
        
        tableView.separatorStyle = .none
        view.backgroundColor = Theme.current.viewControllerBackgroundColor
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadItems()
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
        
        cell.backgroundColor = Theme.current.cellBackgroundColor
        cell.subLessonsNumber.textColor = Theme.current.textColor
        cell.subLessonsTitle.textColor = Theme.current.textColor
        cell.subLessonsDescription.textColor = Theme.current.textColor
        cell.tintColor = Theme.current.buttonColor
        
        let backgroundView = UIView()
        backgroundView.backgroundColor = Theme.current.selectedRow
        cell.selectedBackgroundView = backgroundView
        
        cell.subLessonsNumber.text = "\(indexPath.row + 1)."
        cell.subLessonsTitle.text = resultsSubLessons[indexesToSublessons[0]].lessons[indexesToSublessons[1]].subLessons[indexPath.row].subLessonsTitle
        cell.subLessonsDescription.text = resultsSubLessons[indexesToSublessons[0]].lessons[indexesToSublessons[1]].subLessons[indexPath.row].subLessonsTitleDescription
        cell.accessoryType = resultsSubLessons[indexesToSublessons[0]].lessons[indexesToSublessons[1]].subLessons[indexPath.row].completion ? .checkmark : .none
        //print(resultsSubLessons[indexesToSublessons[0]].subLessons[indexPath.row].completion)
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // let lesn = resultsSubLessons[indexesToSublessons[0]].subLessons[indexPath.row]
        let lessonTypeA = resultsSubLessons[indexesToSublessons[0]].lessons[indexesToSublessons[1]].subLessons[indexPath.row].lessonA.count
        let lessonTypeB = resultsSubLessons[indexesToSublessons[0]].lessons[indexesToSublessons[1]].subLessons[indexPath.row].lessonB.count
        print("typeA \(lessonTypeA), typeB \(lessonTypeB)")
        
        var indexes = indexesToSublessons
        indexes.append(indexPath.row)
        print("indexes \(indexes)")
        if lessonTypeA == 1 {
            
            performSegue(withIdentifier: "goToSubLessonsA", sender: self)
            indexesALesson = indexes
            print("Indexy po przejsci do konkretnej lekcji A \(indexesALesson)")
            
        } else if lessonTypeB == 1 {
            
            indexesBLesson = indexes
            performSegue(withIdentifier: "goToSubLessonsB", sender: self)
            print("Indexy po przejsci do konkretnej lekcji B \(indexesALesson)")
        }
        
        
        
        //        if typeA == "A" {
        //
        //            indexesALesson = indexes
        //            performSegue(withIdentifier: "goToSubLessonsA", sender: self)
        //
        //        } else if typeB == "B" {
        //
        //            performSegue(withIdentifier: "goToSubLessonsB", sender: self)
        //            indexesBLesson = indexes
        //        }
        
    }
    
    // MARK: - LoadRealm function
    
    private func loadItems() {
        
        resultsSubLessons = realm.objects(CollectionOfLessons.self)
        resultsLessonsInSublessons = realm.objects(LessonsData.self)
        tableView.reloadData()
        
    }
    
}
