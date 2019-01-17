//
//  LessonData.swift
//  Meet Swift
//
//  Created by Filip on 17/01/2019.
//  Copyright © 2019 Filip. All rights reserved.
//

import Foundation
import RealmSwift

class LessonData: Object {
    
    @objc dynamic let typeOfTask: String = ""
    @objc dynamic let lessonDescription: String = ""
    @objc dynamic let lessonExample: String = ""
    @objc dynamic let lessonTask: String = ""
    @objc dynamic let lessonAnswer: String = ""
    
    var parentSubLessonsData = LinkingObjects(fromType: SubLessonsData.self, property: "lessonData")  //Reverse category realationship
    
}
