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
    
    var stuckTimer = Timer()
    var seconds: Int = 60
    
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var correctSubViewButton: UIButton!
    @IBOutlet weak var correctSubViewLabel: UILabel!
    @IBOutlet weak var correctSubView: UIView!
    @IBOutlet weak var hintSubView: UIView!
    @IBOutlet weak var hintSubViewLabel: UILabel!
    @IBOutlet weak var hintSubViewButtonLabel: UIButton!
    @IBOutlet weak var incorectSubView: UIView!
    @IBOutlet weak var incorectSubViewLabel: UILabel!
    @IBOutlet weak var incorectSubViewSubViewButtonLabel: UIButton!
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
        
        
        stuckTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(stuckTimerStage) , userInfo: nil, repeats: true)
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    // MARK: - LoadRealm function
    
    private func loadItems() {
        
        resultsLesson = realm.objects(LessonsData.self)
        
    }
    



// MARK: - IBACtions


    
    @IBAction func buttonA(_ sender: UIButton!) {
        if let buttonCurrentTitle = sender.currentTitle { checkBTypeLessonAnswer(buttonCurrentTitle) }
    }
    
    
    @IBAction func buttonB(_ sender: UIButton!) {
        if let buttonCurrentTitle = sender.currentTitle { checkBTypeLessonAnswer(buttonCurrentTitle)  }
    }
    
    
    @IBAction func buttonC(_ sender: UIButton!) {
        if let buttonCurrentTitle = sender.currentTitle { checkBTypeLessonAnswer(buttonCurrentTitle) }
    }
    
    
    @IBAction func incorectSubViewButton(_ sender: UIButton!) {
        showHintSubView()
    }
    
    
    @IBAction func correctSubVIewButton(_ sender: UIButton!) {
        
        
        if resultsLesson[indexesLesson[1]].subLessons[indexesLesson[2]].completion == true {
            
            if indexesLesson[2] < resultsLesson[indexesLesson[1]].subLessons.count - 1  {
                
                indexesLesson[2] += 1
                self.viewDidLoad()
                
            } else if indexesLesson[2] == resultsLesson[indexesLesson[1]].subLessons.count - 1 {
                
                
                navigationController?.popViewController(animated: true)
                
                dismiss(animated: true, completion: nil)
                
                
            }
        }
    }
    
    
    @IBAction func hintSubViewButton(_ sender: UIButton!) {
        print("Button hintButtonAction from Hintview")
        backToOryginalStage()
        
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
        print("Button hintButtonAction from toolbar")
        showHintSubView()
    }
    
    
    @objc func checkButtonAction(sender: UIButton!) {
        print("Button checkButtonAction")
        
        try! realm.write {
            resultsLesson[indexesLesson[1]].subLessons[indexesLesson[2]].userAnswer = textView.text
            
        }
        
        if resultsLesson[indexesLesson[1]].subLessons[indexesLesson[2]].userAnswer ==  resultsLesson[indexesLesson[1]].subLessons[indexesLesson[2]].lessonCorrectAnswer {
            
            textView.endEditing(true)
            
            completionRealmSaveAndShowCorrectSubView()
            
        } else  {
            
            showIncorectSubView()
            
        }
        
    }
    
    
    @objc func doneButtonAction(sender: UIButton!) {
        print("Button checkButtonAction")
        
        try! realm.write {
            resultsLesson[indexesLesson[1]].subLessons[indexesLesson[2]].userAnswer = textView.text
        }
        
        textView.endEditing(true)
    }
    
    
    
    // MARK - Usable Functions
    
    private func checkBTypeLessonAnswer(_ buttonTitle: String) {
        
        
        if buttonTitle == resultsLesson[indexesLesson[1]].subLessons[indexesLesson[2]].lessonCorrectAnswer {
            
            completionRealmSaveAndShowCorrectSubView()
            
        } else {
            
            showIncorectSubView()
            
        }
    }
    
    
    
    private func completionRealmSaveAndShowCorrectSubView() {
        
        try! realm.write {
            resultsLesson[indexesLesson[1]].subLessons[indexesLesson[2]].completion = true
        }
        
        correctSubView.alpha = 0
        UIView.animate(withDuration: 0.6, animations: {
            self.correctSubView.isHidden = false
            self.correctSubViewLabel.text = "Correct Answer Go To Next Lesson"
            self.hintSubView.isHidden = true
            self.incorectSubView.isHidden = true
            self.correctSubView.alpha = 1
        })
        buttonALabel.isEnabled = false
        buttonBLabel.isEnabled = false
        buttonCLabel.isEnabled = false
        stuckTimer.invalidate()
        
    }
    
}


