//
//  LessonsTableViewController.swift
//  Meet Swift
//
//  Created by Filip on 10/12/2018.
//  Copyright © 2018 Filip. All rights reserved.
//

import UIKit
import RealmSwift



class LessonsTableViewController: UITableViewController {
    
    lazy var realm = try! Realm()
    
    var resultsOfCollectionOfLessons: Results<CollectionOfLessons>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        
        try! realm.write {
            
            let beginnerLessons = CollectionOfLessons()
            beginnerLessons.isExpanded = true
            beginnerLessons.title = "Beginner"
            
            
            
        }
        
        //loadItems()
        applyTheme()
        
        
    }
    
  
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        applyTheme()
        //loadItems()
        tableView.reloadData()
    }
    
    
    // MARK: - TableView Section settings
    
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return resultsOfCollectionOfLessons?.count ?? 1
    }
    
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = UIView()
        
        let headerButton:UIButton = {
            let button = UIButton()
            button.frame = CGRect(x: 0, y: 4, width: UIScreen.main.bounds.width, height: 35)
            button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 50, bottom: 0, right: 0)
            button.setTitle(resultsOfCollectionOfLessons?[section].title, for: .normal)
            button.contentHorizontalAlignment = .left
            button.titleLabel?.font = UIFont.systemFont(ofSize: 20.0)
            button.addTarget(self, action: #selector(handleOpenClose), for: .touchUpInside)
            button.tag = section
            return button
        }()
        
        let headerCounterLabel: UILabel = {
            let label = UILabel()
            label.frame = CGRect(x: UIScreen.main.bounds.width - 50, y: 4, width: 50, height: 35)
            label.font = UIFont.systemFont(ofSize: 14.0)
            return label
        }()
        
        view.addSubview(headerCounterLabel)
        view.addSubview(headerButton)
        
        view.backgroundColor = Theme.current.headerBackgroundColor
        headerCounterLabel.textColor = Theme.current.textColor
        
        if !(resultsOfCollectionOfLessons?[section].isExpanded)! {

            headerButton.setTitleColor(Theme.current.buttonColor, for: .normal)

        } else {

            headerButton.setTitleColor(Theme.current.pressedSectionButton, for: .normal)
        }
        
        let sumOfLessonsInSection = resultsOfCollectionOfLessons?[section].lessons.count
        var sumOfDoneLessonsInSection = 0
        
        for n in 0..<(resultsOfCollectionOfLessons?[section].lessons.count)! {
            
            if resultsOfCollectionOfLessons?[section].lessons[n].subLessons.count == resultsOfCollectionOfLessons?[section].lessons[n].completionCounter {
                
                sumOfDoneLessonsInSection += 1
                
            }
        }
        
        headerCounterLabel.text = "\(sumOfDoneLessonsInSection)/\(sumOfLessonsInSection!)"
        
        return view
    }
    
    
    
    // MARK: - TableView Row settings
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if !(resultsOfCollectionOfLessons?[section].isExpanded)! {
            return 0
        }
        return (resultsOfCollectionOfLessons?[section].lessons.count)!
        
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "LessonsCell", for: indexPath) as! CustomLessonsCell
        
        let valueCounterCompletionCounterForProgressBar = resultsOfCollectionOfLessons[indexPath.section].lessons[indexPath.row].completionCounter
        let subLessonsCounterForProgressBar = resultsOfCollectionOfLessons[indexPath.section].lessons[indexPath.row].subLessons.count
        print(subLessonsCounterForProgressBar)
        
        let backgroundView = UIView()
        backgroundView.backgroundColor = Theme.current.selectedRow
        cell.selectedBackgroundView = backgroundView
        
        cell.backgroundColor = Theme.current.cellBackgroundColor
        cell.lessonsNumber.textColor = Theme.current.textColor
        cell.lessonsTitle.textColor = Theme.current.textColor
        cell.progressLabel.textColor = Theme.current.textColor
        cell.progressBar.progressTintColor = Theme.current.progressTintColor
        cell.progressBar.trackTintColor = Theme.current.buttonColor
        
        cell.lessonsNumber.text = "\(indexPath.row + 1)."
        cell.lessonsTitle.text = resultsOfCollectionOfLessons[indexPath.section].lessons[indexPath.row].title
        if subLessonsCounterForProgressBar == 0 {
            cell.progressBar.progress = 0.0
        } else {
             cell.progressBar.progress = Float((Double(100/subLessonsCounterForProgressBar) * 0.01) * Double(valueCounterCompletionCounterForProgressBar))
        }
      
        cell.progressLabel.text = "\(valueCounterCompletionCounterForProgressBar)/\(subLessonsCounterForProgressBar)"
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //        performSegue(withIdentifier: "goToSubLessonsView", sender: self)
        
        let name = resultsOfCollectionOfLessons[indexPath.section].lessons[indexPath.row].title
        subLessonsTitle = name
        
        let indexPaths = [indexPath.section,indexPath.row]
        print(indexPaths)
        indexPathsInSublessons = [indexPath.section,indexPath.row]
        //self.tableView.deselectRow(at: indexPath, animated: true)
        
       
        
        
    }
    
    
    
   // MARK: - HandleOpenClosefunction
    
    @objc func handleOpenClose(headerButton: UIButton) {
        
        let section = headerButton.tag
        var indexPaths = [IndexPath]()
        
        for row in resultsOfCollectionOfLessons[section].lessons.indices {
            
            let indexPath = IndexPath(row: row, section: section)
            indexPaths.append(indexPath)
            
        }
        
        let isExpanded = resultsOfCollectionOfLessons[section].isExpanded
        try! realm.write {
            resultsOfCollectionOfLessons[section].isExpanded = !isExpanded
        }

        if isExpanded {

            tableView.deleteRows(at: indexPaths, with: .fade)
            headerButton.setTitleColor(Theme.current.buttonColor, for: .normal)

        } else {
        
            tableView.insertRows(at: indexPaths, with: .fade)
            headerButton.setTitleColor(Theme.current.pressedSectionButton, for: .normal)
            
        }
        
        if section == 0 {
            
            tableView.scrollsToTop = true
            
        } else {
            
            tableView.layoutIfNeeded()
            tableView.scrollRectToVisible(CGRect(x: 0  , y: tableView.contentSize.height - tableView.bounds.size.height  , width: tableView.bounds.size.width, height: tableView.bounds.size.height), animated: true)
            
        }
        
        
    }
    
    
    
    // MARK: - Theme function
    
    private func applyTheme() {
        
        navigationController?.navigationBar.barStyle = Theme.current.style
        navigationController?.navigationBar.tintColor = Theme.current.buttonColor // color of navigationbar buttons
        navigationController?.navigationBar.barTintColor = Theme.current.navigationColor // color of navigationbar
        view.backgroundColor = Theme.current.viewControllerBackgroundColor
        
    }
    
    
    
    // MARK: - Theme function
    
    private func loadItems() {
        
        resultsOfCollectionOfLessons = realm.objects(CollectionOfLessons.self)
        tableView.reloadData()
        
    }
}
