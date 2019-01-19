//
//  LessonBViewController.swift
//  Meet Swift
//
//  Created by Filip on 17/01/2019.
//  Copyright © 2019 Filip. All rights reserved.
//

import UIKit
import RealmSwift

var indexesBLesson:[Int] = []

class LessonBViewController: UIViewController {
    
    lazy var realm = try! Realm()
    
    var resultsBLesson: Results<LessonsData>!
    
    
    @IBOutlet weak var changer: UISwitch!
    
    //print(resultsALesson[indexLesson].completion)
    
    @IBAction func changer(_ sender: UISwitch) {
        
        
        print(resultsBLesson[indexesBLesson[1]].subLessons[indexesBLesson[2]].completion)
        try! realm.write {

            resultsBLesson[indexesBLesson[1]].subLessons[indexesBLesson[2]].completion = true
            
            
           //resultsBLesson[indexesBLesson[1]].completionCounter += 1
            
        }
       
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadItems()
        applyTheme()
        
        self.title = resultsBLesson[indexesBLesson[0]].subLessons[indexesBLesson[1]].subLessonsTitle
        changer.setOn(resultsBLesson[indexesBLesson[1]].subLessons[indexesBLesson[2]].completion, animated: false)
        let headerCounterLabel: UILabel = {
            let label = UILabel()
            label.frame = CGRect(x: UIScreen.main.bounds.width - 50, y: 4, width: 50, height: 35)
            label.font = UIFont.systemFont(ofSize: 14.0)
            label.text = "Lekcja B"
            label.textColor = Theme.current.textColor
            return label
        }()
        // Do any additional setup after loading the view.
        
        view.addSubview(headerCounterLabel)
        view.backgroundColor = Theme.current.viewControllerBackgroundColor
    }
    
    
    // MARK: - Theme function
    
    private func applyTheme() {
        
        view.backgroundColor = Theme.current.viewControllerBackgroundColor
        //exampleLabel.textColor = Theme.current.buttonColor
        
    }
    
    
    // MARK: - LoadRealm function
    
    private func loadItems() {
        
        resultsBLesson = realm.objects(LessonsData.self)
        
    }
    
}
