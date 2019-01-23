//
//  LessonBViewController.swift
//  Meet Swift
//
//  Created by Filip on 17/01/2019.
//  Copyright © 2019 Filip. All rights reserved.
//

import UIKit
import RealmSwift



class LessonBViewController: UIViewController {
    
    
    lazy var realm = try! Realm()
    var resultsBLesson: Results<LessonsData>!
    var indexesBLesson:[Int] = []
    
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var exampleLabel: UILabel!
    @IBOutlet weak var hintLabel: UILabel!
    @IBOutlet weak var changer: UISwitch!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadItems()
        applyTheme()
        setLessonBNavBar() 
        
        
        
        changer.setOn(resultsBLesson[indexesBLesson[1]].subLessons[indexesBLesson[2]].completion, animated: false)
        
        hintLabel.isHidden = true
        hintLabel.adjustsFontSizeToFitWidth = true
        
        
        let toolBar = UIToolbar()
        var buttonsArray = [UIBarButtonItem]()
        buttonsArray.append(
            UIBarButtonItem(title: "Previous", style: .plain, target: self, action: #selector(previousButtonAction))
        )
        
        buttonsArray.append(
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        )
        
        buttonsArray.append(
            UIBarButtonItem(title: "Hint", style: .plain, target: self, action: #selector(hintButtonAction))
        )
        
        buttonsArray.append(
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        )
        
        
        buttonsArray.append(
            UIBarButtonItem(title: "Check", style: .plain, target: self, action: #selector(checkButtonAction))
        )
        
        toolBar.setItems(buttonsArray, animated: true)
        toolBar.tintColor = Theme.current.buttonColor
        toolBar.barTintColor = Theme.current.navigationColor
        
        view.addSubview(toolBar)
        
        
        
        // MARK: - Constraint settup
        
        toolBar.translatesAutoresizingMaskIntoConstraints = false
        
        if #available(iOS 11.0, *) {
            let guide = self.view.safeAreaLayoutGuide
            toolBar.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
            toolBar.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
            toolBar.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
            toolBar.heightAnchor.constraint(equalToConstant: 44).isActive = true
            
        } else {
            NSLayoutConstraint(item: toolBar, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1.0, constant: 0).isActive = true
            NSLayoutConstraint(item: toolBar, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
            NSLayoutConstraint(item: toolBar, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1.0, constant: 0).isActive = true
            
            toolBar.heightAnchor.constraint(equalToConstant: 44).isActive = true
            
        }
        
        
    }
    
    
    
    @IBAction func changer(_ sender: UISwitch) {
        
        try! realm.write {
            resultsBLesson[indexesBLesson[1]].subLessons[indexesBLesson[2]].completion = true
            
        }
        
    }
    
    
    // MARK: - ToolBarButtons
    
    @objc func previousButtonAction(sender: UIButton!) {
        print("Button tapped")
    }
    
    @objc func hintButtonAction(sender: UIButton!) {
        hintLabel.isHidden = false
        print("Button tapped")
    }
    
    @objc func checkButtonAction(sender: UIButton!) {
        print("Button tapped")
    }

    
    // MARK: - LoadRealm function
    
    private func loadItems() {
        
        resultsBLesson = realm.objects(LessonsData.self)
        
    }
    
    
    // MARK: - Theme function
    
    private func applyTheme() {
        
        view.backgroundColor = Theme.current.viewControllerBackgroundColor
        descriptionLabel.textColor = Theme.current.textColor
        exampleLabel.textColor = Theme.current.buttonColor
        hintLabel.textColor = Theme.current.textColor
        hintLabel.backgroundColor = Theme.current.selectedRow
        
    }

    
}


extension LessonBViewController {
    
    private func setLessonBNavBar() {
        
        navigationItem.title = "\(resultsBLesson[indexesBLesson[0]].subLessons[indexesBLesson[1]].subLessonsTitle)"
        
        let rightBtt = UIButton(type: .system)
        rightBtt.isUserInteractionEnabled = false
        rightBtt.tintColor = Theme.current.textColor
        rightBtt.setTitle("\(indexesBLesson[2] + 1)/\(resultsBLesson[indexesBLesson[0]].subLessons.count)", for: .normal)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightBtt)
        
       
        
    }
    
}
