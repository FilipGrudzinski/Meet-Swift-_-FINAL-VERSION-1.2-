//
//  LessonViewController.swift
//  Meet Swift
//
//  Created by Filip on 10/12/2018.
//  Copyright © 2018 Filip. All rights reserved.
//

import UIKit
import RealmSwift
import Highlightr


class LessonViewController: UIViewController, UITextViewDelegate, UIToolbarDelegate {
    
    
    lazy var realm = try! Realm()
    var resultsLesson: Results<LessonsData>!
    var indexesLesson:[Int] = []
    
    var textView: UITextView?
    var toolBar: UIToolbar?
    
    var stuckTimer = Timer()
    var incorrectTimer = Timer()
    var hintTimer = Timer()
    
    var seconds: Int = 60
    
    let highlightr = Highlightr()
   
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var correctSubViewButton: UIButton!
    @IBOutlet weak var correctSubViewLabel: UILabel!
    @IBOutlet weak var correctSubView: UIView!
    @IBOutlet weak var hintSubView: UIView!
    @IBOutlet weak var hintSubViewLabel: UILabel!
    @IBOutlet weak var hintSubViewButtonLabel: UIButton!
    @IBOutlet weak var incorrectSubView: UIView!
    @IBOutlet weak var incorrectSubViewLabel: UILabel!
    @IBOutlet weak var incorrectSubViewSubViewButtonLabel: UIButton!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var exampleLabel: UILabel!
    
    @IBOutlet weak var lessonBPointA: UILabel!
    @IBOutlet weak var lessonBPointB: UILabel!
    @IBOutlet weak var lessonBPointC: UILabel!
    
    @IBOutlet weak var lessonBAnswerA: UILabel!
    @IBOutlet weak var lessonBAnswerB: UILabel!
    @IBOutlet weak var lessonBAnswerC: UILabel!
    
    @IBOutlet weak var buttonALabel: UIButton!
    @IBOutlet weak var buttonBLabel: UIButton!
    @IBOutlet weak var buttonCLabel: UIButton!
    @IBOutlet weak var exampleTitle: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadItems()
        setLessonNavBar()
        createToolBar()
        layoutLessonSetUp()
        applyLessonTheme()
        loadLessonStringValueToLessonLabels()
        
        highlightr?.setTheme(to: "atelier-cave-light")
        
        stuckTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(stuckTimerStage) , userInfo: nil, repeats: true)
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
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
                
                toTheNextLesson()
                
            } else {
                
                backToSubLessonVC()
                
            }
            
        }
    }
    
    
    @IBAction func hintSubViewButton(_ sender: UIButton!) {
        //print("Button hintButtonAction from Hintview")
        backToOryginalStage()
        
    }
    
    
    @objc func previousButtonAction(sender: UIButton!) {
        //print("Button previousButtonAction")
        
        if indexesLesson[2] > 0 {
            
            indexesLesson[2] -= 1
            
            if resultsLesson[indexesLesson[1]].subLessons[indexesLesson[2]].typeOfTask == "A" {
                
            }
            textView?.removeFromSuperview()
            toolBar?.removeFromSuperview()
            self.viewDidLoad()
            
        } else {
            
            backToSubLessonVC()
            
        }
        
    }
    
    
    @objc func hintButtonAction(sender: UIButton!) {
        //print("Button hintButtonAction from toolbar")
        showHintSubView()
    }
    
    
    @objc func checkButtonAction(sender: UIButton!) {
        //print("Button checkButtonAction")
        
        try! realm.write {
            resultsLesson[indexesLesson[1]].subLessons[indexesLesson[2]].userAnswer = textView?.attributedText.string
            
        }
        
        if resultsLesson[indexesLesson[1]].subLessons[indexesLesson[2]].userAnswer == resultsLesson[indexesLesson[1]].subLessons[indexesLesson[2]].lessonCorrectAnswer {
            
            completionRealmSaveAndCheckIfAllLessonAreCompleted()
            
        } else  {
            
            showIncorectSubView()
            
            
        }
        
    }
    
    
    @objc func doneButtonAction(sender: UIButton!) {
        //print("Button checkButtonAction")
        
        try! realm.write {
            resultsLesson[indexesLesson[1]].subLessons[indexesLesson[2]].userAnswer = textView?.attributedText.string
        }
        
        view.endEditing(true)
    }
    
    
    
    // MARK: - Usable Functions
    
    
    
    private func loadItems() {
        
        resultsLesson = realm.objects(LessonsData.self)
        
    }
    
    
    private func loadLessonStringValueToLessonLabels() {
        
        let highlightr = Highlightr()
        highlightr?.setTheme(to: "atelier-cave-light")
        
        let lessonDescriptionCode = highlightr!.highlight(resultsLesson[indexesLesson[1]].subLessons[indexesLesson[2]].lessonDescription, as: "swift")
        let lessonExampleCode = highlightr!.highlight(resultsLesson[indexesLesson[1]].subLessons[indexesLesson[2]].lessonExample, as: "swift")
        let lessonAnswerOneCode = highlightr!.highlight(resultsLesson[indexesLesson[1]].subLessons[indexesLesson[2]].lessonAnswerOne, as: "swift")
        let lessonAnswerTwoCode = highlightr!.highlight(resultsLesson[indexesLesson[1]].subLessons[indexesLesson[2]].lessonAnswerTwo, as: "swift")
        let lessonAnswerThreeCode = highlightr!.highlight(resultsLesson[indexesLesson[1]].subLessons[indexesLesson[2]].lessonAnswerThree, as: "swift")
        
        descriptionLabel.attributedText = lessonDescriptionCode
        exampleLabel.attributedText = lessonExampleCode
        lessonBAnswerA.attributedText = lessonAnswerOneCode
        lessonBAnswerB.attributedText = lessonAnswerTwoCode
        lessonBAnswerC.attributedText = lessonAnswerThreeCode
        
    }
    
    
    private func checkBTypeLessonAnswer(_ buttonTitle: String) {
        
        
        if buttonTitle == resultsLesson[indexesLesson[1]].subLessons[indexesLesson[2]].lessonCorrectAnswer {
            
            completionRealmSaveAndCheckIfAllLessonAreCompleted()
            
            
        } else {
            
            showIncorectSubView()
            
        }
    }
    
    

    
    
    private func completionRealmSaveAndCheckIfAllLessonAreCompleted() {
        
        try! realm.write {
            resultsLesson[indexesLesson[1]].subLessons[indexesLesson[2]].completion = true
        }
        
        var toPopUpCounter = 0
            
            for lesson in 0..<resultsLesson[indexesLesson[1]].subLessons.count {
                
                if resultsLesson[indexesLesson[1]].subLessons[lesson].completion == true {
                    
                    toPopUpCounter += 1
                    print(toPopUpCounter)
                    
                }
                
            }
            
            if toPopUpCounter == resultsLesson[indexesLesson[1]].subLessons.count {

                popUp()

            } else {

                showCorrectSubView()

            }
        
    }
    
    
    
    private func popUp() {
        
        let alert = UIAlertController(title: "Awesome", message: "You completed \(resultsLesson[indexesLesson[1]].title) lessons", preferredStyle: .alert)
        
        let okayAction = UIAlertAction(title: "Okay", style: .cancel) {(UIAlertAction) in self.backToSubLessonVC()}
        
        alert.addAction(okayAction)
        
        
        present(alert, animated: true, completion: nil)
        
    }
    
    private func backToSubLessonVC() {
        
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
        
    }
    
    private func toTheNextLesson() {
        
            indexesLesson[2] += 1
            textView?.removeFromSuperview()
            toolBar?.removeFromSuperview()
            self.viewDidLoad()
            
    }
    
    
}
