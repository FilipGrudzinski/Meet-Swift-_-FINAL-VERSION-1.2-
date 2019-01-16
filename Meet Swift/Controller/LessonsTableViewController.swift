//
//  LessonsTableViewController.swift
//  Meet Swift
//
//  Created by Filip on 10/12/2018.
//  Copyright © 2018 Filip. All rights reserved.
//

import UIKit



//struct LessonsData {
//    
//    var isExpanded: Bool
//    let title: String
//    var lessonsArray: [String]
//    
//}

//struct LessonsArrayData {
//
//    var completion: Int
//    let title: String
//    var subLessonsArray: [SubLessonsArrayData]
//
//}
//
//struct SubLessonsArrayData {
//
//    var completion: Bool
//    let subLessonsTitle: String
//    let subLessonsTitleDescription: String
//    var lessonData: [String]
//
//}


class LessonsTableViewController: UITableViewController {
    
    
//    let sectionTitles = ["Beginner", "Intermediate", "Advanced"]
//    let sections0 = BeginnerLessonsBank()
//    let sections1 = IntermediateLessonsBank()
//    let sections2 = IntermediateLessonsBank()
//
    
    var twoDimensionArray = rozdzialy
    
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
        
        //print(section)
        
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
        
        if !twoDimensionArray[section].isExpanded {
            
            headerButton.setTitleColor(Theme.current.buttonColor, for: .normal)
            
        } else {
            
            headerButton.setTitleColor(Theme.current.pressedSectionButton, for: .normal)
        }
        
        if section == 0 {
            
            let sumaRozdzialow = twoDimensionArray[0].lessonsData.count
            var sum = 0
            for n in 0..<sumaRozdzialow {
                print("n \(n)")
              
                let sumaPod = twoDimensionArray[0].lessonsData[n].subLessonsData.count
                print(sumaPod)
                if sumaPod == twoDimensionArray[0].lessonsData[n].completionCounter {
                    
                    sum += 1
                    
                }
                
            
            }
            print("sum \(sum)")
            
            headerCounterLabel.text = "\(sum)/\(sumaRozdzialow)"
//            let b = twoDimensionArray[0].lessonsData[sumaRozdzialow - 1].subLessonsData.count
//            print(b)
            
        
            
//            headerCounterLabel.text = "\(sum)/\(twoDimensionArray[section].lessonsData.count)"
//
        
        } else if section == 1 {
            
            
            
        } else if section == 2 {
            
            
            
        }
        
//        var sum = 0
//        var subsum = 0
//        for _ in twoDimensionArray[section].lessonsData {
//
//            for _ in twoDimensionArray[section].lessonsData[twoDimensionArray[section].lessonsData.count - 1].subLessonsData {
//
//                let sumaRozwiazanychPodRozdzialow = twoDimensionArray[section].lessonsData[twoDimensionArray[section].lessonsData.count - 1].completionCounter
//                let sumaPodRozdzialowWLekcji = twoDimensionArray[section].lessonsData[twoDimensionArray[section].lessonsData.count - 1].subLessonsData.count
//
//                if sumaRozwiazanychPodRozdzialow == sumaPodRozdzialowWLekcji {
//                    sum += 1
//                    print(sum)
//                }
//
//                subsum += 1
//
//            }
//
//
//
//
//        }
        //print(twoDimensionArray[section].lessonsData.count - 1)
        //print(twoDimensionArray[section].lessonsData[twoDimensionArray[section].lessonsData.count - 1].subLessonsData.count)
            
             //headerCounterLabel.text = "\(subsum)/\(twoDimensionArray[section].lessonsData.count)"
  
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
        
        return twoDimensionArray[section].lessonsData.count
        
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "LessonsCell", for: indexPath) as! CustomLessonsCell
        
        let valueCounterCompletionCounterForProgressBar = twoDimensionArray[indexPath.section].lessonsData[indexPath.row].completionCounter
        let subLessonsCounterForProgressBar = twoDimensionArray[indexPath.section].lessonsData[indexPath.row].subLessonsData.count
        
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
        cell.lessonsTitle.text = twoDimensionArray[indexPath.section].lessonsData[indexPath.row].title
        cell.progressBar.progress = Float((Double(100/subLessonsCounterForProgressBar) * 0.01) * Double(valueCounterCompletionCounterForProgressBar))
        cell.progressLabel.text = "\(valueCounterCompletionCounterForProgressBar)/\(subLessonsCounterForProgressBar)"
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //        performSegue(withIdentifier: "goToSubLessonsView", sender: self)
        
        let name = twoDimensionArray[indexPath.section].lessonsData[indexPath.row].title
        subLessonsTitle = name
        
        //self.tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    
    @objc func handleOpenClose(headerButton: UIButton) {
        
        let section = headerButton.tag
        var indexPaths = [IndexPath]()
        
        for row in twoDimensionArray[section].lessonsData.indices {
            
            let indexPath = IndexPath(row: row, section: section)
            indexPaths.append(indexPath)
            
        }
        
        let isExpanded = twoDimensionArray[section].isExpanded
        twoDimensionArray[section].isExpanded = !isExpanded
        
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
    
    
}
