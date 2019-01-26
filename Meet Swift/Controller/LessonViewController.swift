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
     
        
        Timer.scheduledTimer(timeInterval: 30.0, target: self, selector: #selector(showIncorectSubView) , userInfo: nil, repeats: false)
        
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
    
    
    @IBAction func icorectSubViewButton(_ sender: Any) {
        showHintSubView()
    }
    
    
    
    @IBAction func correctSubVIewButton(_ sender: Any) {
        
        if resultsLesson[indexesLesson[0]].subLessons[indexesLesson[1]].completion == true {
            
            if indexesLesson[2] <= resultsLesson[indexesLesson[0]].subLessons.count  {
                
                indexesLesson[2] += 1
                self.viewDidLoad()
            }
        }
    }
    
    
    
    @IBAction func hintSubViewButton(_ sender: Any) {
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
            resultsLesson[indexesLesson[0]].subLessons[indexesLesson[1]].userAnswer = textView.text
            
        }
        
        if resultsLesson[indexesLesson[0]].subLessons[indexesLesson[1]].userAnswer ==  resultsLesson[indexesLesson[0]].subLessons[indexesLesson[1]].lessonCorrectAnswer {
            
            correctSubView.alpha = 0
            UIView.animate(withDuration: 0.6, animations: {
                self.correctSubView.isHidden = false
                self.correctSubViewLabel.text = "Correct Answer Go To Next Lesson"
                self.hintSubView.isHidden = true
                self.incorectSubView.isHidden = true
                self.correctSubView.alpha = 1
            })
            textView.endEditing(true)
           
            try! realm.write {
                resultsLesson[indexesLesson[0]].subLessons[indexesLesson[1]].completion = true
                
            }
            
        } else  {
            
            incorectSubView.alpha = 0
            UIView.animate(withDuration: 0.6, animations: {
                
                self.incorectSubViewLabel.text = "Wrong Answer maybe you need Hint? -> "
                self.hintSubView.isHidden = true
                self.incorectSubView.isHidden = false
                self.incorectSubView.alpha = 1
                
            })
            
            Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(backToOryginalStage) , userInfo: nil, repeats: false)
        }
        
    }
    
    
    @objc func doneButtonAction(sender: UIButton!) {
        print("Button checkButtonAction")
        
        try! realm.write {
            resultsLesson[indexesLesson[0]].subLessons[indexesLesson[1]].userAnswer = textView.text
        }
        
        textView.endEditing(true)
    }
    
    
    @objc private func showIncorectSubView() {
        
        incorectSubView.alpha = 0
        UIView.animate(withDuration: 0.6, animations: {
            
            self.incorectSubViewLabel.text = "Stuck? Maybe Need Help"
            self.incorectSubView.isHidden = false
            self.incorectSubView.alpha = 1
            
        })
        
        Timer.scheduledTimer(timeInterval: 10.0, target: self, selector: #selector(backToOryginalStage) , userInfo: nil, repeats: false)
        
    }
    
    
    
    private func showHintSubView() {
        
        
        hintSubView.alpha = 0
        UIView.animate(withDuration: 0.6, animations: {
            self.hintSubView.isHidden = false
            self.hintSubView.alpha = 1
            self.hintSubViewLabel.text = "Przykładowy tekst podpowiedzi"
            //self.hintSubViewLabel.text = resultsLesson[indexesLesson[0]].subLessons[indexesLesson[1]].lessonHint
            self.incorectSubView.isHidden = true
            self.correctSubView.isHidden = true
            self.descriptionLabel.isHidden = true
            
        })
        
        Timer.scheduledTimer(timeInterval: 20.0, target: self, selector: #selector(backToOryginalStage) , userInfo: nil, repeats: false)
    }
    
    
    
    @objc private func backToOryginalStage() {
        
        hintSubView.alpha = 1
        correctSubView.alpha = 1
        incorectSubView.alpha = 1
        UIView.animate(withDuration: 0.6, animations: {
            self.hintSubView.isHidden = true
            self.correctSubView.isHidden = true
            self.incorectSubView.isHidden = true
            self.descriptionLabel.isHidden = false
            self.hintSubView.alpha = 0
            self.correctSubView.alpha = 0
            self.incorectSubView.alpha = 0
        })
        
        
    }
 
    private func checkBTypeLessonAnswer() {
        
        
    }
    
    
}
