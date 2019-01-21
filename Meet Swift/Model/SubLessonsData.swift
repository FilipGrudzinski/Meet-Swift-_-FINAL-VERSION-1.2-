//
//  File2.swift
//  Meet Swift
//
//  Created by Filip on 17/01/2019.
//  Copyright © 2019 Filip. All rights reserved.
//

import Foundation
import RealmSwift


class SubLessonsData: Object {
    
    @objc dynamic var typeOfTask: String = ""
    @objc dynamic var completion: Bool = false
    @objc dynamic var subLessonsTitle: String = ""
    @objc dynamic var subLessonsTitleDescription: String = ""
    @objc dynamic var lessonDescription: String = ""
    @objc dynamic var lessonExample: String = ""
    @objc dynamic var lessonTask: String = ""
    @objc dynamic var lessonHint: String = ""
    @objc dynamic var lessonAnswerOne: String = ""
    @objc dynamic var lessonAnswerTwo: String = ""
    @objc dynamic var lessonAnswerThree: String = ""
    @objc dynamic var lessonCorrectAnswer: String = ""
    @objc dynamic var userAnswer: String?
   
    
    var parentLessonsData = LinkingObjects(fromType: LessonsData.self, property: "subLessons")  //Reverse category realationship
    
}


