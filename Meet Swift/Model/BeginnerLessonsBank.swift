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
        
        list.append(LessonsModel(text: "Lesson 1", lvl: "Beginner", completionBool: true))
        list.append(LessonsModel(text: "Lesson 2", lvl: "Beginner", completionBool: true))
        list.append(LessonsModel(text: "Lesson 3", lvl: "Beginner", completionBool: true))
        list.append(LessonsModel(text: "Lesson 4", lvl: "Beginner", completionBool: true))
        list.append(LessonsModel(text: "Lesson 5", lvl: "Beginner", completionBool: true))
        list.append(LessonsModel(text: "Lesson 6", lvl: "Beginner", completionBool: true))
        list.append(LessonsModel(text: "Lesson 7", lvl: "Beginner", completionBool: true))
        list.append(LessonsModel(text: "Lesson 8", lvl: "Beginner", completionBool: true))
        list.append(LessonsModel(text: "Lesson 9", lvl: "Intermediate", completionBool: true))
        list.append(LessonsModel(text: "Lesson 10", lvl: "Intermediate", completionBool: true))
        list.append(LessonsModel(text: "Lesson 11", lvl: "Intermediate", completionBool: true))
        list.append(LessonsModel(text: "Lesson 12", lvl: "Intermediate", completionBool: true))
        list.append(LessonsModel(text: "Lesson 13", lvl: "Intermediate", completionBool: true))
        list.append(LessonsModel(text: "Lesson 14", lvl: "Intermediate", completionBool: true))

        
    }
    
}

