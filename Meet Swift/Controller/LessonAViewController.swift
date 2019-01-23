//
//  LessonViewController.swift
//  Meet Swift
//
//  Created by Filip on 10/12/2018.
//  Copyright © 2018 Filip. All rights reserved.
//

import UIKit
import RealmSwift



class LessonAViewController: UIViewController, UITextViewDelegate {

    
    lazy var realm = try! Realm()
    var resultsALesson: Results<LessonsData>!
    var indexesALesson:[Int] = []
    
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var exampleLabel: UILabel!
    @IBOutlet weak var hintLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        loadItems()
        applyTheme()
        setLessonANavBar()
        createToolBar()
        
        textView.delegate = self
        textView.text = "Type your thoughts here..."
        textView.textColor = .lightGray
        
        
        hintLabel.isHidden = true
        hintLabel.adjustsFontSizeToFitWidth = true
        exampleLabel.adjustsFontSizeToFitWidth = true
        
//        if resultsALesson[indexesALesson[0]].subLessons[indexesALesson[1]].userAnswer != nil {
//
//            textField.text = "Dupa"
//
//        }
        
      
        
        
    }
    
    
    
 
    
    
    
    // MARK: - ToolBarButtons
    
    @objc func previousButtonAction(sender: UIButton!) {
        print("Button previousButtonAction")
        
        exampleLabel.text = "if fdfsdfd {\n fds \n} else \n{\nffdsfdsf\n}"
        
        
        descriptionLabel.text = "DUPAdsaddaDUPAdsaddaDUPAdsaddaDUPAdsaddaDUPAdsaddaDUPAdsaddaDUPAdsaddaDUPAdsaddaDUPAdsaddaDUPAdsaddaDUPAdsaddaDUPAdsaddaDUPAdsaddaDUPAdsaddaDUPAdsaddaDUPAdsaddaDUPAdsaddaDUPAdsaddaDUPAdsaddaDUPAdsaddaDUPAdsaddaDUPAdsaddaDUPAdsaddaDUPAdsaddaDUPAdsaddaDUPAdsadd"
  
    }
    
    
    @objc func hintButtonAction(sender: UIButton!) {
        hintLabel.isHidden = false
        descriptionLabel.isHidden = true
        print("Button hintButtonAction")
    }
    
    
    @objc func checkButtonAction(sender: UIButton!) {
        print("Button checkButtonAction")
    }

    
    // MARK: - LoadRealm function
    
    private func loadItems() {
        
        resultsALesson = realm.objects(LessonsData.self)
        
    }

    // MARK: - Theme function
    
    
    private func applyTheme() {
        
        view.backgroundColor = Theme.current.viewControllerBackgroundColor
        descriptionLabel.textColor = Theme.current.textColor
        exampleLabel.textColor = Theme.current.buttonColor
//        textField.backgroundColor = Theme.current.viewControllerBackgroundColor
//        textField.tintColor = Theme.current.textColor
        hintLabel.textColor = Theme.current.textColor
        hintLabel.backgroundColor = Theme.current.selectedRow
        textView.backgroundColor = Theme.current.viewControllerBackgroundColor
        textView.textColor = Theme.current.textColor
        
    }
    
    
    func textViewDidBeginEditing (_ textView: UITextView) {
        if textView.isFirstResponder {
            textView.text = nil
            textView.textColor = Theme.current.textColor
            
        }
    }
    
    func textViewDidEndEditing (_ textView: UITextView) {
        if textView.text.isEmpty || textView.text == "" {
            //textView.textColor = UIColor.lightGray
            textView.text = "Type your thoughts here..."
            textView.tintColor = Theme.current.selectedRow
        }
    }

    
  
    
}



extension LessonAViewController {
    
    
    private func setLessonANavBar() {
        
        navigationItem.title = "\(resultsALesson[indexesALesson[0]].subLessons[indexesALesson[1]].subLessonsTitle)"
        
        let rightBtt = UIButton(type: .system)
        rightBtt.isUserInteractionEnabled = false
        rightBtt.tintColor = Theme.current.textColor
        rightBtt.setTitle("\(indexesALesson[2] + 1)/\(resultsALesson[indexesALesson[0]].subLessons.count)", for: .normal)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightBtt)
       
        
    }
    
    
    private func createToolBar() {
        
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
    
}
