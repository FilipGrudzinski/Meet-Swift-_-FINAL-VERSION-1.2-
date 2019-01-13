//
//  LessonsTableViewController.swift
//  Meet Swift
//
//  Created by Filip on 10/12/2018.
//  Copyright © 2018 Filip. All rights reserved.
//

import UIKit



class LessonsTableViewController: UITableViewController{
    
    
    let sectionTitles = ["Beginner", "Intermediate", "Advanced"]
    let sections0 = BeginnerLessonsBank()
    let sections1 = IntermediateLessonsBank()
    let sections2 = ["2sda32", "3232fdfd3","sekcja 3"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        applyTheme()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        applyTheme()
        tableView.reloadData()
    }
    
    
    
    // MARK: - TableView Section settings
    
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
    }
    
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9519319969, green: 0.9519319969, blue: 0.9519319969, alpha: 1)
        let headerLabel = UILabel()
        headerLabel.text = sectionTitles[section]
        headerLabel.frame = CGRect(x: 51, y: 4, width: UIScreen.main.bounds.width - 100, height: 35)
        headerLabel.font = UIFont.boldSystemFont(ofSize: 20.0)
        
        let counterLabel = UILabel()
        counterLabel.text = "0/20"
        counterLabel.frame = CGRect(x: UIScreen.main.bounds.width - 50, y: 4, width: 100, height: 35)
        counterLabel.font = UIFont.systemFont(ofSize: 14.0)
        
        view.addSubview(counterLabel)
        view.addSubview(headerLabel)
        
        if UserDefaults.standard.bool(forKey: "Theme") {
            view.backgroundColor = Theme.current.headerBackgroundColor
            headerLabel.textColor = Theme.current.textColor
            counterLabel.textColor = Theme.current.textColor
        }
        
        return view
    }
    
    
    
    // MARK: - TableView Row settings
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "LessonsCell", for: indexPath) as! CustomLessonsCell
        
        cell.backgroundColor = Theme.current.cellBackgroundColor
        cell.lessonsNumber.textColor = Theme.current.textColor
        cell.lessonsTitle.textColor = Theme.current.textColor
        cell.progressLabel.textColor = Theme.current.textColor
        cell.progressBar.progressTintColor = Theme.current.progressTintColor
        cell.progressBar.trackTintColor = Theme.current.buttonColor
        
        let backgroundView = UIView()
        backgroundView.backgroundColor = Theme.current.selectedRow
        cell.selectedBackgroundView = backgroundView
        
        
        if indexPath.section == 0 {
            cell.lessonsNumber.text = "\(indexPath.row + 1)."
            cell.lessonsTitle.text = sections0.list[indexPath.row].lessonText
            cell.progressBar.progress = 0.8
            cell.progressLabel.text = "0/20"
            
        } else if indexPath.section == 1 {
            cell.lessonsNumber.text = "\(indexPath.row + 1)."
            cell.lessonsTitle.text = sections1.list[indexPath.row].lessonText
            cell.progressBar.progress = 0.09
            cell.progressLabel.text = "0/20"
            
        } else if indexPath.section == 2 {
            cell.lessonsNumber.text = "\(indexPath.row + 1)."
            cell.lessonsTitle.text = sections1.list[indexPath.row].lessonText
            cell.progressBar.progress = 0.01
            cell.progressLabel.text = "0/20"
            
        }
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //performSegue(withIdentifier: "goToSubLessonsView", sender: self)
        
        if indexPath.section == 0 {
            
            let name = sections0.list[indexPath.row].lessonText
            
            subLessonsTitle = name
            
        } else if indexPath.section == 1 {
            
            let name = sections1.list[indexPath.row].lessonText
            
            subLessonsTitle = name
            
            
        } else if indexPath.section == 2 {
            
            let name = sections2[indexPath.row]
            
            subLessonsTitle = name
            
        }
        
        self.tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    // MARK: - Theme function
    
    
    private func applyTheme() {
        
        navigationController?.navigationBar.barStyle = Theme.current.style
        navigationController?.navigationBar.tintColor = Theme.current.buttonColor // color of navigationbar buttons
        navigationController?.navigationBar.barTintColor = Theme.current.navigationColor // color of navigationbar
        view.backgroundColor = Theme.current.viewControllerBackgroundColor
        
    }
    
    
}
