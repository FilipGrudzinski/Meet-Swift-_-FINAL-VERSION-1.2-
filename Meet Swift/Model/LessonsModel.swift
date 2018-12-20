//
//  lessonModel.swift
//  Meet Swift
//
//  Created by Filip on 10/12/2018.
//  Copyright © 2018 Filip. All rights reserved.
//

import Foundation

class LessonsModel {
    

    let lessonText: String
    let lessonlvl: String
    let completion: Bool
    
    init(text: String, lvl: String, completionBool: Bool) {
        
       
        lessonText = text
        lessonlvl = lvl
        completion = completionBool
        
        
    }
    
}


