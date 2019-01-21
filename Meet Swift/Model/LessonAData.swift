//
//  LessonData.swift
//  Meet Swift
//
//  Created by Filip on 17/01/2019.
//  Copyright © 2019 Filip. All rights reserved.
//

import Foundation
import RealmSwift


class LessonAData: Object {
    
    @objc dynamic var typeOfTask: String = ""
    @objc dynamic var lessonDescription: String = ""
    @objc dynamic var lessonExample: String = ""
    @objc dynamic var lessonTask: String = ""
    @objc dynamic var lessonCorrectAnswer: String = ""
    
    var parentSubLessonsData = LinkingObjects(fromType: SubLessonsData.self, property: "lessonA")  //Reverse category realationship
    
}
