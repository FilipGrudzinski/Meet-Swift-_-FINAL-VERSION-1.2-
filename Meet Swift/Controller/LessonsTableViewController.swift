//
//  LessonsTableViewController.swift
//  Meet Swift
//
//  Created by Filip on 10/12/2018.
//  Copyright © 2018 Filip. All rights reserved.
//

import UIKit



struct LessonsData {
    
    var isExpanded: Bool
    let title: String
    var lessonsArray: [String]
    
}

struct LessonsArrayData {
    
    var completion: Int
    let title: String
    var subLessonsArray: [SubLessonsArrayData]
    
}

struct SubLessonsArrayData {
    
    var completion: Bool
    let subLessonsTitle: String
    let subLessonsTitleDescription: String
    var lessonData: [String]
    
}


class LessonsTableViewController: UITableViewController {
    
    
    let sectionTitles = ["Beginner", "Intermediate", "Advanced"]
    let sections0 = BeginnerLessonsBank()
    let sections1 = IntermediateLessonsBank()
    let sections2 = ["2sda32", "3232fdfd3","sekcja 3"]
    
    
    var twoDimensionArray = [
        
        LessonsData(isExpanded: true, title: "Beginner", lessonsArray: ["dsadas","dsadas","dsadas","dsadas","dsadas","dsadas","dsadas","dsadas"]),
        LessonsData(isExpanded: false, title: "Intermediate", lessonsArray: ["dsadas","dsadas","dsadas","dsadas"]),
        LessonsData(isExpanded: false, title: "Advanced", lessonsArray: ["dsadas","dsadas",])
        
        
    ]
    
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
        //return sectionTitles.count
        return twoDimensionArray.count
    }
    
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = UIView()
        
        let headerButton:UIButton = {
            let button = UIButton()
            button.frame = CGRect(x: 0, y: 4, width: UIScreen.main.bounds.width, height: 35)
            button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 50, bottom: 0, right: 0)
            button.setTitle(twoDimensionArray[section].title, for: .normal)
            button.contentHorizontalAlignment = .left
            button.titleLabel?.font = UIFont.systemFont(ofSize: 20.0)
            button.addTarget(self, action: #selector(handleOpenClose), for: .touchUpInside)
            button.tag = section
            return button
       }()
        
        let counterLabel: UILabel = {
            let label = UILabel()
            label.text = "0/20"
            label.frame = CGRect(x: UIScreen.main.bounds.width - 50, y: 4, width: 50, height: 35)
            label.font = UIFont.systemFont(ofSize: 14.0)
            return label
        }()
        
        
        view.addSubview(counterLabel)
        view.addSubview(headerButton)
        
        view.backgroundColor = Theme.current.headerBackgroundColor
        headerButton.setTitleColor(Theme.current.buttonColor, for: .normal)
        counterLabel.textColor = Theme.current.textColor
        
        
        return view
    }
    
    
    
    // MARK: - TableView Row settings
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if !twoDimensionArray[section].isExpanded {
            return 0
        }
        
        return twoDimensionArray[section].lessonsArray.count
        
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

//        performSegue(withIdentifier: "goToSubLessonsView", sender: self)

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
    
    
    @objc func handleOpenClose(button: UIButton) {
        
        let section = button.tag
        
        var indexPaths = [IndexPath]()
        
        for row in twoDimensionArray[section].lessonsArray.indices {
            
            let indexPath = IndexPath(row: row, section: section)
            indexPaths.append(indexPath)
            
        }
        
        let isExpanded = twoDimensionArray[section].isExpanded
        twoDimensionArray[section].isExpanded = !isExpanded
        
        if isExpanded {
            
            tableView.deleteRows(at: indexPaths, with: .none)
            button.setTitleColor(Theme.current.buttonColor, for: .normal)
            
        } else {
            
            tableView.insertRows(at: indexPaths, with: .none)
            button.setTitleColor(Theme.current.pressedSectionButton, for: .normal)
        }
        
    }
    
    
    // MARK: - Theme function
    
    
    private func applyTheme() {
        
        navigationController?.navigationBar.barStyle = Theme.current.style
        navigationController?.navigationBar.tintColor = Theme.current.buttonColor // color of navigationbar buttons
        navigationController?.navigationBar.barTintColor = Theme.current.navigationColor // color of navigationbar
        view.backgroundColor = Theme.current.viewControllerBackgroundColor
        
    }
    
    
}
