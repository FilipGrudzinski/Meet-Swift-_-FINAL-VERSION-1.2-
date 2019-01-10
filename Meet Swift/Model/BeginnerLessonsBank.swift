//
//  lessonsBank.swift
//  Meet Swift
//
//  Created by Filip on 10/12/2018.
//  Copyright © 2018 Filip. All rights reserved.
//

import Foundation

class BeginnerLessonsBank {
    
    var list = [LessonsModel]()
    
    init() {
        
        list.append(LessonsModel(text: "The Basics", lvl: "Beginner", completionBool: true))
        list.append(LessonsModel(text: "Basic Operators 2", lvl: "Beginner", completionBool: true))
        list.append(LessonsModel(text: "Strings and Characters", lvl: "Beginner", completionBool: true))
        list.append(LessonsModel(text: "Collection Types", lvl: "Beginner", completionBool: true))
        list.append(LessonsModel(text: "Control Flow", lvl: "Beginner", completionBool: true))
        list.append(LessonsModel(text: "Functions", lvl: "Beginner", completionBool: true))
        list.append(LessonsModel(text: "Closures", lvl: "Beginner", completionBool: true))
        list.append(LessonsModel(text: "Enumerations", lvl: "Beginner", completionBool: true))
        list.append(LessonsModel(text: "Lesson 9", lvl: "Intermediate", completionBool: true))
        list.append(LessonsModel(text: "Lesson 10", lvl: "Intermediate", completionBool: true))
        list.append(LessonsModel(text: "Lesson 11", lvl: "Intermediate", completionBool: true))
        list.append(LessonsModel(text: "Lesson 12", lvl: "Intermediate", completionBool: true))
        list.append(LessonsModel(text: "Lesson 13", lvl: "Intermediate", completionBool: true))
        list.append(LessonsModel(text: "Lesson 14", lvl: "Intermediate", completionBool: true))

        
    }
    
}

