//
//  File1.swift
//  Meet Swift
//
//  Created by Filip on 17/01/2019.
//  Copyright © 2019 Filip. All rights reserved.
//

import Foundation
import RealmSwift


class LessonsData: Object {
    
    @objc dynamic var completionCounter: Int = 0
    @objc dynamic var title: String = ""
    let subLessons = List<SubLessonsData>()
    
    var parentCollectionOfLessons = LinkingObjects(fromType: CollectionOfLessons.self, property: "lessons")  //Reverse category realationship

    
}

