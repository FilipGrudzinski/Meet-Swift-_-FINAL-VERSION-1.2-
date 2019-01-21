//
//  LessonBData.swift
//  Meet Swift
//
//  Created by Filip on 21/01/2019.
//  Copyright © 2019 Filip. All rights reserved.
//

import Foundation
import RealmSwift


class LessonBData: Object {
    
    @objc dynamic var typeOfTask: String = ""
    @objc dynamic var lessonDescription: String = ""
    @objc dynamic var lessonExample: String = ""
    @objc dynamic var lessonTask: String = ""
    @objc dynamic var lessonCorrectAnswerOne: String = ""
    @objc dynamic var lessonCorrectAnswerTwo: String = ""
    @objc dynamic var lessonCorrectAnswerThree: String = ""
    
    var parentSubLessonsData = LinkingObjects(fromType: SubLessonsData.self, property: "lessonB")  //Reverse category realationship
    
}
