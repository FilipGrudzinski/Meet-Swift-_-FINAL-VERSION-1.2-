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
    
    @objc dynamic var completion: Bool = false
    @objc dynamic var subLessonsTitle: String = ""
    @objc dynamic var subLessonsTitleDescription: String = ""
    let lessonA = List<LessonAData>()
    let lessonB = List<LessonBData>()
    
    var parentLessonsData = LinkingObjects(fromType: LessonsData.self, property: "subLessons")  //Reverse category realationship
    
}


