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
    @IBOutlet weak var lessonTaskBLabel: UILabel!
    @IBOutlet weak var buttonALabel: UIButton!
    @IBOutlet weak var buttonBLabel: UIButton!
    @IBOutlet weak var buttonCLabel: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadItems()
        applyLessonTheme()
        setLessonNavBar()
        createToolBar()
        layoutLessonSetUp()
        textView.delegate = self
        
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
        
      
    }
    
    
    
    
}
