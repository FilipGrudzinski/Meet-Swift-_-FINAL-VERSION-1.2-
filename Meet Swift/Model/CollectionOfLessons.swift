//
//  File.swift
//  Meet Swift
//
//  Created by Filip on 17/01/2019.
//  Copyright © 2019 Filip. All rights reserved.
//

import Foundation
import RealmSwift



class CollectionOfLessons: Object {
    
    @objc dynamic var isExpanded: Bool = false
    @objc dynamic let title: String = ""
    
    let lessons = List<LessonsData>()
    
}

