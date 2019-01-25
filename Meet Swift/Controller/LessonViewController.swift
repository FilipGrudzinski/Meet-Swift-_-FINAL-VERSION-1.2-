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
    
    
    
    @IBOutlet weak var correctSubViewButton: UIButton!
    @IBOutlet weak var correctSubViewLabel: UILabel!
    @IBOutlet weak var correctSubView: UIView!
    @IBOutlet weak var hintSubView: UIView!
    @IBOutlet weak var hintLabel: UILabel!
    @IBOutlet weak var hintButtonLabel: UIButton!
    
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var exampleLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var lessonTaskBLabel: UILabel!
    @IBOutlet weak var buttonALabel: UIButton!
    @IBOutlet weak var buttonBLabel: UIButton!
    @IBOutlet weak var buttonCLabel: UIButton!
    @IBOutlet weak var exampleTitle: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadItems()
        applyLessonTheme()
        setLessonNavBar()
        createToolBar()
        layoutLessonSetUp()
        textView.delegate = self
        hintSubView.isHidden = false
        correctSubView.isHidden = false
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    // MARK: - LoadRealm function
    
    
    private func loadItems() {
        
        resultsLesson = realm.objects(LessonsData.self)
        
    }
    
    
   

    
}


// MARK: - Extension with Buttons


extension LessonViewController {
    
    
    @IBAction func buttonA(_ sender: Any) {
    }
    
    @IBAction func buttonB(_ sender: Any) {
    }
    
    @IBAction func buttonC(_ sender: Any) {
    }
    
    @IBAction func correctSubViewButton(_ sender: Any) {
    }
    
    @IBAction func hintButton(_ sender: Any) {
    }
    
    
    @objc func previousButtonAction(sender: UIButton!) {
        print("Button previousButtonAction")
        
        if indexesLesson[2] > 0 {
            
            indexesLesson[2] -= 1
            self.viewDidLoad()
            
        } else {
            navigationController?.popViewController(animated: true)
            
            dismiss(animated: true, completion: nil)
        }
        
        
        
        
    }
    
    
    @objc func hintButtonAction(sender: UIButton!) {
        print("Button hintButtonAction")
        
       
        
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
    
    @objc func nextButtonAction(sender: UIButton!) {
        print("Button checkButtonAction")
        if resultsLesson[indexesLesson[0]].subLessons[indexesLesson[1]].completion == true {
            
            if indexesLesson[2] <= resultsLesson[indexesLesson[0]].subLessons.count  {
                
                indexesLesson[2] += 1
                self.viewDidLoad()
            }
        } else {
             Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(checkButtonAction), userInfo: nil, repeats: false)
                print("Wrong")
            let wrong:UILabel = {
                let label = UILabel()
                label.font = UIFont.boldSystemFont(ofSize: 14.0)
                label.textColor = UIColor.white
                // label.adjustsFontSizeToFitWidth = true
                label.text = "Wrong answer maybe you need hint?"
                label.textAlignment = .center
                label.backgroundColor = UIColor.red.withAlphaComponent(0.2)
                label.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 30)
                return label
            }()
            
            
            self.view.addSubview(wrong)
            
            
           
            
        }
      
    }
    
    
    private func showWrongAnswer() {
        
        let wrong:UILabel = {
            let label = UILabel()
            label.font = UIFont.boldSystemFont(ofSize: 14.0)
            label.textColor = UIColor.white
            // label.adjustsFontSizeToFitWidth = true
            label.text = "Wrong answer maybe you need hint?"
            label.textAlignment = .center
            label.backgroundColor = UIColor.red.withAlphaComponent(0.2)
            label.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 30)
            return label
        }()
        
        
        self.view.addSubview(wrong)
        
    }
    
  
    
    private func showHintCorrectSubView(sender: AnyObject) {
        
        
        
    }
    
}
