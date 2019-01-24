//
//  LessonViewController.swift
//  Meet Swift
//
//  Created by Filip on 10/12/2018.
//  Copyright © 2018 Filip. All rights reserved.
//

import UIKit
import RealmSwift



class LessonViewController: UIViewController, UITextViewDelegate {
    
    
    lazy var realm = try! Realm()
    var resultsLesson: Results<LessonsData>!
    var indexesLesson:[Int] = []
    
  
    
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var exampleLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var lessonBlabel: UILabel!
    @IBOutlet weak var buttonALabel: UIButton!
    @IBOutlet weak var buttonBLabel: UIButton!
    @IBOutlet weak var buttonCLabel: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        loadItems()
        applyTheme()
        setLessonNavBar()
        createToolBar()
        
        textView.delegate = self
        
        
        
        if resultsLesson[indexesLesson[1]].subLessons[indexesLesson[2]].typeOfTask == "A" {
            
            
            textView.isHidden = false
            
            
            
            textView.text = "Enter your code here..."
            textView.textColor = Theme.current.buttonColor
            
            createToolBarAboveKeyboard()
            
        } else {
            
            
            
        }
        
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    // MARK: - LoadRealm function
    
    
    private func loadItems() {
        
        resultsLesson = realm.objects(LessonsData.self)
        
    }
    
    // MARK: - Theme function
    
    
    private func applyTheme() {
        
        view.backgroundColor = Theme.current.viewControllerBackgroundColor
        descriptionLabel.textColor = Theme.current.textColor
        exampleLabel.textColor = Theme.current.textColor
        textView.backgroundColor = Theme.current.viewControllerBackgroundColor
        
    }
    
    
    func textViewDidBeginEditing (_ textView: UITextView) {
        if textView.textColor == Theme.current.buttonColor && textView.isFirstResponder {
            textView.text = nil
            textView.textColor = Theme.current.textColor
        }
    }
    
    func textViewDidEndEditing (_ textView: UITextView) {
        
        if textView.text.isEmpty || textView.text == "" {
            textView.textColor = Theme.current.buttonColor
            textView.text = "Enter your code here..."
        }
        
        
    }
    
}


extension LessonViewController {
    
    
    private func setLessonNavBar() {
        
        navigationItem.title = "\(resultsLesson[indexesLesson[1]].subLessons[indexesLesson[2]].subLessonsTitle)"
        
        let rightBtt = UIButton(type: .system)
        rightBtt.isUserInteractionEnabled = false
        rightBtt.tintColor = Theme.current.textColor
        rightBtt.setTitle("\(indexesLesson[2] + 1)/\(resultsLesson[indexesLesson[1]].subLessons.count)", for: .normal)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightBtt)
        
        
    }
    
    private func createToolBar() {
        
        let toolBar = UIToolbar()
        
        var buttonsArray = [UIBarButtonItem]()
     
        
      
        
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
        toolBar.isTranslucent = false
        toolBar.setShadowImage(UIImage(), forToolbarPosition: .bottom)
        
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
    
    
    
    private func createToolBarAboveKeyboard() {
        
        
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        var buttonsArray = [UIBarButtonItem]()
        buttonsArray.append(
            UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneButtonAction))
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
        
        
        textView.inputAccessoryView = toolBar
        
        
    }
    
    
}




extension LessonViewController {
    
    
    @IBAction func buttonA(_ sender: Any) {
    }
    
    @IBAction func buttonB(_ sender: Any) {
    }
    
    @IBAction func buttonC(_ sender: Any) {
    }
    
    
    
    @objc func previousButtonAction(sender: UIButton!) {
        print("Button previousButtonAction")
        
//        exampleLabel.text = "if fdfsdfd {\n fds \n} else \n{\nffdsfdsf\n}DUPAdsaddaDUPAdsaddaDUPAdsaddaDUPAdsaddaDUPAdsaddaDUPAdsaddaDUPAdsaddaDUPAdsaddaDUPAdsaddaDUPAdsaddaDUPAdsaddaDUPAdsaddaDUPAdsaddaUPAdsaddaDUPAdsaddaDUDUPAdsaddaDUPAdsad"
//
//
//        descriptionLabel.text = "DUPAdsaddaDUPAdsaddaDUPAdsaddaDUPAdsaddaDUPAdsaddaDUPAdsaddaDUPAdsaddaDUPAdsadDUPAdsaddaDUPAdsaddaDUPAdsaddaDUPAdsaddaDUPAdsaddaDUPAdsaddaDUPAdsaddaDUPAdsaddaDUPAdsaddaDUPAdsaddaDUPAdsaddaDUPAdsaddaDUPAdsaddaDUPAdsaddaDUPAdsaddaDUPAdsaddaDUPAdsaddaDUPAdsaddaD"
        
      
        
            
        
    }
    
    
    @objc func hintButtonAction(sender: UIButton!) {
        
//        navigationController?.popViewController(animated: true)
//
//        dismiss(animated: true, completion: nil)
        print("Button hintButtonAction")
        indexesLesson[2] += 1
        //loadItems()
        self.viewDidLoad()
        
    }
    
    
    @objc func checkButtonAction(sender: UIButton!) {
        print("Button checkButtonAction")
        
        try! realm.write {
            resultsLesson[indexesLesson[0]].subLessons[indexesLesson[1]].userAnswer = textView.text
        }
        
        textView.endEditing(true)
    }
    
    @objc func doneButtonAction(sender: UIButton!) {
        print("Button checkButtonAction")
        
        try! realm.write {
            resultsLesson[indexesLesson[0]].subLessons[indexesLesson[1]].userAnswer = textView.text
        }
        
        textView.endEditing(true)
    }
    



}
