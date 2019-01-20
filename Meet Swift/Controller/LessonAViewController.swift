//
//  LessonViewController.swift
//  Meet Swift
//
//  Created by Filip on 10/12/2018.
//  Copyright © 2018 Filip. All rights reserved.
//

import UIKit
import RealmSwift

var indexesALesson:[Int] = []

class LessonAViewController: UIViewController, UITextFieldDelegate {
    
    lazy var realm = try! Realm()
    
    var resultsALesson: Results<LessonsData>!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var exampleLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var hintLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.textField.delegate = self
        
        loadItems()
        applyTheme()
        self.title = resultsALesson[indexesALesson[0]].subLessons[indexesALesson[1]].subLessonsTitle
        
        
        let rightBarButtonItem: UIBarButtonItem = {
            let barButtonItem = UIBarButtonItem(title: "\(indexesALesson[2] + 1)/\(resultsALesson[indexesALesson[0]].subLessons.count)", style: .plain , target: nil, action: nil)
            barButtonItem.tintColor = Theme.current.textColor
            return barButtonItem
        }()
        
        self.navigationItem.rightBarButtonItem = rightBarButtonItem
        
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
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    @objc func previousButtonAction(sender: UIButton!) {
        print("Button previousButtonAction")
    }
    
    
    @objc func hintButtonAction(sender: UIButton!) {
        hintLabel.isHidden = false
        print("Button hintButtonAction")
    }
    
    
    @objc func checkButtonAction(sender: UIButton!) {
        print("Button checkButtonAction")
    }
    
    
    
    
    
    // MARK: - Theme function
    
    
    private func applyTheme() {
        
        view.backgroundColor = Theme.current.viewControllerBackgroundColor
        descriptionLabel.textColor = Theme.current.textColor
        exampleLabel.textColor = Theme.current.buttonColor
        textField.backgroundColor = Theme.current.selectedRow
        textField.tintColor = Theme.current.textColor
        hintLabel.textColor = Theme.current.textColor
        hintLabel.backgroundColor = Theme.current.selectedRow
        
    }
    
    
    // MARK: - LoadRealm function
    
    private func loadItems() {
        
        resultsALesson = realm.objects(LessonsData.self)
        
    }
}
