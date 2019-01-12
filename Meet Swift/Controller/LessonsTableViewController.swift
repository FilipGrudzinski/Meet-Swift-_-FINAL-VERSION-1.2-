//
//  LessonsTableViewController.swift
//  Meet Swift
//
//  Created by Filip on 10/12/2018.
//  Copyright © 2018 Filip. All rights reserved.
//

import UIKit

class LessonsTableViewController: UITableViewController{
    
    var selectedRow = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 0.5)
    
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

    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = UIView()
        let headerLabel = UILabel()
        headerLabel.text = sectionTitles[section]
        headerLabel.frame = CGRect(x: 15, y: 5, width: 100, height: 35)
        headerLabel.font = UIFont.boldSystemFont(ofSize: 16.0)
        
        view.addSubview(headerLabel)
        
//        if !mode  {
//            view.backgroundColor = #colorLiteral(red: 0.9607132469, green: 0.9607132469, blue: 0.9607132469, alpha: 1)
//            headerLabel.textColor = UIColor.black
//        } else {
//            view.backgroundColor = #colorLiteral(red: 0.07058823529, green: 0.07058823529, blue: 0.07058823529, alpha: 1)
//            headerLabel.textColor = #colorLiteral(red: 0.9008589757, green: 0.9056003387, blue: 0.9056003387, alpha: 1)
//        }
        
        return view
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return sectionTitles.count
        
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
         
        let cell = tableView.dequeueReusableCell(withIdentifier: "LessonsCell", for: indexPath) as! CustomLessonsCell
        cell.backgroundColor = Theme.current.cellBackgroundColor
//        let backgroundView = UIView()
//        backgroundView.backgroundColor = selectedRow
           //cell.selectedBackgroundView?.backgroundColor = selectedRow
       
        
        if indexPath.section == 0 {
            cell.lessonsNumber.text = "\(indexPath.row + 1)."
            cell.lessonsTitle.text = sections0.list[indexPath.row].lessonText
            cell.progressBar.progress = 0.05
            //cell.lessonsProgressLabel.text = "0/20"
            
        } else if indexPath.section == 1 {
            cell.lessonsNumber.text = "\(indexPath.row + 1)."
            cell.lessonsTitle.text = sections1.list[indexPath.row].lessonText
            cell.progressBar.progress = 0.09
            //cell.lessonsProgressLabel.text = "0/20"
            
        } else if indexPath.section == 2 {
            cell.lessonsNumber.text = "\(indexPath.row + 1)."
            cell.lessonsTitle.text = sections1.list[indexPath.row].lessonText
            cell.progressBar.progress = 0.01
            //cell.lessonsProgressLabel.text = "0/20"
            
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
    
    

    private func applyTheme() {

        navigationController?.navigationBar.barStyle = Theme.current.style
        navigationController?.navigationBar.tintColor = Theme.current.buttonColor // color of navigationbar buttons
        navigationController?.navigationBar.barTintColor = Theme.current.navigationColor // color of navigationbar
        view.backgroundColor = Theme.current.viewControllerBackgroundColor

    }
}
