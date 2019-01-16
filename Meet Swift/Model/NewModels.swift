//
//  NewModels.swift
//  Meet Swift
//
//  Created by Filip on 15/01/2019.
//  Copyright © 2019 Filip. All rights reserved.
//

import UIKit


struct LessonsStruct { // Rozdziały
    
    var isExpanded: Bool
    let title: String
    var lessonsData: [LessonsDataStruct]
    
}

struct LessonsDataStruct {
    
    var completionCounter: Int
    let title: String
    var subLessonsData: [SubLessonsDataStruct]
    
}

struct SubLessonsDataStruct {
    
    var completion: Bool
    let subLessonsTitle: String
    let subLessonsTitleDescription: String
    //var lessonData: [String]
    
}



var podrozdzialyPoczatkujacy = [
    SubLessonsDataStruct(completion: false, subLessonsTitle: "Podrozdział 1", subLessonsTitleDescription: "Opis Podrozdziału 1"),
    SubLessonsDataStruct(completion: false, subLessonsTitle: "Podrozdział 2", subLessonsTitleDescription: "Opis Podrozdziału 2"),
    SubLessonsDataStruct(completion: false, subLessonsTitle: "Podrozdział 3", subLessonsTitleDescription: "Opis Podrozdziału 3"),
    SubLessonsDataStruct(completion: false, subLessonsTitle: "Podrozdział 4", subLessonsTitleDescription: "Opis Podrozdziału 4"),
    SubLessonsDataStruct(completion: false, subLessonsTitle: "Podrozdział 5", subLessonsTitleDescription: "Opis Podrozdziału 5"),
]
var podrozdzialyPoczatkujacy1 = [
    SubLessonsDataStruct(completion: false, subLessonsTitle: "Podrozdział 1", subLessonsTitleDescription: "Opis Podrozdziału 1"),
//    SubLessonsArrayDataStruct(completion: false, subLessonsTitle: "Podrozdział 2", subLessonsTitleDescription: "Opis Podrozdziału 2"),
//    SubLessonsArrayDataStruct(completion: false, subLessonsTitle: "Podrozdział 3", subLessonsTitleDescription: "Opis Podrozdziału 3"),
//    SubLessonsArrayDataStruct(completion: false, subLessonsTitle: "Podrozdział 4", subLessonsTitleDescription: "Opis Podrozdziału 4"),
//    SubLessonsArrayDataStruct(completion: false, subLessonsTitle: "Podrozdział 5", subLessonsTitleDescription: "Opis Podrozdziału 5"),
]
var podrozdzialyPoczatkujacy2 = [
    SubLessonsDataStruct(completion: false, subLessonsTitle: "Podrozdział 1", subLessonsTitleDescription: "Opis Podrozdziału 1"),
    SubLessonsDataStruct(completion: false, subLessonsTitle: "Podrozdział 2", subLessonsTitleDescription: "Opis Podrozdziału 2"),
//    SubLessonsArrayDataStruct(completion: false, subLessonsTitle: "Podrozdział 3", subLessonsTitleDescription: "Opis Podrozdziału 3"),
//    SubLessonsArrayDataStruct(completion: false, subLessonsTitle: "Podrozdział 4", subLessonsTitleDescription: "Opis Podrozdziału 4"),
//    SubLessonsArrayDataStruct(completion: false, subLessonsTitle: "Podrozdział 5", subLessonsTitleDescription: "Opis Podrozdziału 5"),
]
var podrozdzialyPoczatkujacy3 = [
    SubLessonsDataStruct(completion: false, subLessonsTitle: "Podrozdział 1", subLessonsTitleDescription: "Opis Podrozdziału 1"),
    SubLessonsDataStruct(completion: false, subLessonsTitle: "Podrozdział 2", subLessonsTitleDescription: "Opis Podrozdziału 2"),
    SubLessonsDataStruct(completion: false, subLessonsTitle: "Podrozdział 3", subLessonsTitleDescription: "Opis Podrozdziału 3"),
//    SubLessonsArrayDataStruct(completion: false, subLessonsTitle: "Podrozdział 4", subLessonsTitleDescription: "Opis Podrozdziału 4"),
//    SubLessonsArrayDataStruct(completion: false, subLessonsTitle: "Podrozdział 5", subLessonsTitleDescription: "Opis Podrozdziału 5"),
]


var podrozdzialySredniozaws = [
    SubLessonsDataStruct(completion: false, subLessonsTitle: "Podrozdział 1", subLessonsTitleDescription: "Opis Podrozdziału 1"),
    SubLessonsDataStruct(completion: false, subLessonsTitle: "Podrozdział 2", subLessonsTitleDescription: "Opis Podrozdziału 2"),
    SubLessonsDataStruct(completion: false, subLessonsTitle: "Podrozdział 3", subLessonsTitleDescription: "Opis Podrozdziału 3"),
    SubLessonsDataStruct(completion: false, subLessonsTitle: "Podrozdział 4", subLessonsTitleDescription: "Opis Podrozdziału 4"),
    SubLessonsDataStruct(completion: false, subLessonsTitle: "Podrozdział 5", subLessonsTitleDescription: "Opis Podrozdziału 5"),
]

var podrozdzialySredniozaws1 = [
    SubLessonsDataStruct(completion: false, subLessonsTitle: "Podrozdział 1", subLessonsTitleDescription: "Opis Podrozdziału 1"),
    SubLessonsDataStruct(completion: false, subLessonsTitle: "Podrozdział 2", subLessonsTitleDescription: "Opis Podrozdziału 2"),
    SubLessonsDataStruct(completion: false, subLessonsTitle: "Podrozdział 3", subLessonsTitleDescription: "Opis Podrozdziału 3"),
    SubLessonsDataStruct(completion: false, subLessonsTitle: "Podrozdział 4", subLessonsTitleDescription: "Opis Podrozdziału 4"),
    SubLessonsDataStruct(completion: false, subLessonsTitle: "Podrozdział 5", subLessonsTitleDescription: "Opis Podrozdziału 5"),
]

var podrozdzialySredniozaws2 = [
    SubLessonsDataStruct(completion: false, subLessonsTitle: "Podrozdział 1", subLessonsTitleDescription: "Opis Podrozdziału 1"),
    SubLessonsDataStruct(completion: false, subLessonsTitle: "Podrozdział 2", subLessonsTitleDescription: "Opis Podrozdziału 2"),
    SubLessonsDataStruct(completion: false, subLessonsTitle: "Podrozdział 3", subLessonsTitleDescription: "Opis Podrozdziału 3"),
    SubLessonsDataStruct(completion: false, subLessonsTitle: "Podrozdział 4", subLessonsTitleDescription: "Opis Podrozdziału 4"),
    SubLessonsDataStruct(completion: false, subLessonsTitle: "Podrozdział 5", subLessonsTitleDescription: "Opis Podrozdziału 5"),
]

var podrozdzialySredniozaws3 = [
    SubLessonsDataStruct(completion: false, subLessonsTitle: "Podrozdział 1", subLessonsTitleDescription: "Opis Podrozdziału 1"),
    SubLessonsDataStruct(completion: false, subLessonsTitle: "Podrozdział 2", subLessonsTitleDescription: "Opis Podrozdziału 2"),
//    SubLessonsArrayDataStruct(completion: false, subLessonsTitle: "Podrozdział 3", subLessonsTitleDescription: "Opis Podrozdziału 3"),
//    SubLessonsArrayDataStruct(completion: false, subLessonsTitle: "Podrozdział 4", subLessonsTitleDescription: "Opis Podrozdziału 4"),
//    SubLessonsArrayDataStruct(completion: false, subLessonsTitle: "Podrozdział 5", subLessonsTitleDescription: "Opis Podrozdziału 5"),
]

var podrozdzialySredniozaws4 = [
    SubLessonsDataStruct(completion: false, subLessonsTitle: "Podrozdział 1", subLessonsTitleDescription: "Opis Podrozdziału 1"),
    SubLessonsDataStruct(completion: false, subLessonsTitle: "Podrozdział 2", subLessonsTitleDescription: "Opis Podrozdziału 2"),
    SubLessonsDataStruct(completion: false, subLessonsTitle: "Podrozdział 3", subLessonsTitleDescription: "Opis Podrozdziału 3"),
//    SubLessonsArrayDataStruct(completion: false, subLessonsTitle: "Podrozdział 4", subLessonsTitleDescription: "Opis Podrozdziału 4"),
//    SubLessonsArrayDataStruct(completion: false, subLessonsTitle: "Podrozdział 5", subLessonsTitleDescription: "Opis Podrozdziału 5"),
]

var podrozdzialyZaawansowany = [
    SubLessonsDataStruct(completion: false, subLessonsTitle: "Podrozdział 1", subLessonsTitleDescription: "Opis Podrozdziału 1"),
//    SubLessonsArrayDataStruct(completion: false, subLessonsTitle: "Podrozdział 2", subLessonsTitleDescription: "Opis Podrozdziału 2"),
//    SubLessonsArrayDataStruct(completion: false, subLessonsTitle: "Podrozdział 3", subLessonsTitleDescription: "Opis Podrozdziału 3"),
//    SubLessonsArrayDataStruct(completion: false, subLessonsTitle: "Podrozdział 4", subLessonsTitleDescription: "Opis Podrozdziału 4"),
//    SubLessonsArrayDataStruct(completion: false, subLessonsTitle: "Podrozdział 5", subLessonsTitleDescription: "Opis Podrozdziału 5"),
]
var podrozdzialyZaawansowany1 = [
//    SubLessonsArrayDataStruct(completion: false, subLessonsTitle: "Podrozdział 1", subLessonsTitleDescription: "Opis Podrozdziału 1"),
//    SubLessonsArrayDataStruct(completion: false, subLessonsTitle: "Podrozdział 2", subLessonsTitleDescription: "Opis Podrozdziału 2"),
//    SubLessonsArrayDataStruct(completion: false, subLessonsTitle: "Podrozdział 3", subLessonsTitleDescription: "Opis Podrozdziału 3"),
    SubLessonsDataStruct(completion: false, subLessonsTitle: "Podrozdział 4", subLessonsTitleDescription: "Opis Podrozdziału 4"),
//    SubLessonsArrayDataStruct(completion: false, subLessonsTitle: "Podrozdział 5", subLessonsTitleDescription: "Opis Podrozdziału 5"),
]


var LessonsArrayDataStructDataPoczatkujacy = [LessonsDataStruct(completionCounter: 1, title: "Rozdział Poczatkujacy 1", subLessonsData: podrozdzialyPoczatkujacy),
                                              LessonsDataStruct(completionCounter: 0, title: "Rozdział Poczatkujacy 2", subLessonsData: podrozdzialyPoczatkujacy1),
                                              LessonsDataStruct(completionCounter: 0, title: "Rozdział Poczatkujacy 3", subLessonsData: podrozdzialyPoczatkujacy2),
                                              LessonsDataStruct(completionCounter: 0, title: "Rozdział Poczatkujacy 4", subLessonsData: podrozdzialyPoczatkujacy3),
]

var LessonsArrayDataStructDataSrednio = [LessonsDataStruct(completionCounter: 5, title: "Rozdział Srednio 1", subLessonsData: podrozdzialySredniozaws),
                                         LessonsDataStruct(completionCounter: 4, title: "Rozdział Srednio 2", subLessonsData: podrozdzialySredniozaws1),
                                         LessonsDataStruct(completionCounter: 3, title: "Rozdział Srednio 3", subLessonsData: podrozdzialySredniozaws2),
                                         LessonsDataStruct(completionCounter: 1, title: "Rozdział Srednio 4", subLessonsData: podrozdzialySredniozaws3),
                                         LessonsDataStruct(completionCounter: 2, title: "Rozdział Srednio 5", subLessonsData: podrozdzialySredniozaws4),
 LessonsDataStruct(completionCounter: 1, title: "Rozdział Srednio 6", subLessonsData: podrozdzialySredniozaws4),]

var LessonsArrayDataStructDataZaawansowany = [LessonsDataStruct(completionCounter: 1, title: "Rozdział Zaawansowany 1", subLessonsData: podrozdzialyZaawansowany),
                                              LessonsDataStruct(completionCounter: 1, title: "Rozdział Zaawansowany 2", subLessonsData: podrozdzialyZaawansowany1),
]


var rozdzialy = [LessonsStruct(isExpanded: false, title: "Początkujący", lessonsData: LessonsArrayDataStructDataPoczatkujacy),
                 LessonsStruct(isExpanded: true, title: "ŚrednioZaawansowany", lessonsData: LessonsArrayDataStructDataSrednio),
                 LessonsStruct(isExpanded: false, title: "Zaawansowany", lessonsData: LessonsArrayDataStructDataZaawansowany),
]



