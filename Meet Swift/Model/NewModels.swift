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
    let typeOfTask: String
    //var lessonData: [String]
    
}



var podrozdzialyPoczatkujacy = [
    SubLessonsDataStruct(completion: false, subLessonsTitle: "Podrozdział Poczatkujacy 1", subLessonsTitleDescription: "Opis Podrozdziału Poczatkujacy 1", typeOfTask: "B"),
    SubLessonsDataStruct(completion: false, subLessonsTitle: "Podrozdział Poczatkujacy 2", subLessonsTitleDescription: "Opis Podrozdziału Poczatkujacy 2", typeOfTask: "B"),
    SubLessonsDataStruct(completion: false, subLessonsTitle: "Podrozdział Poczatkujacy 3", subLessonsTitleDescription: "Opis Podrozdziału Poczatkujacy 3", typeOfTask: "B"),
    SubLessonsDataStruct(completion: false, subLessonsTitle: "Podrozdział Poczatkujacy 4", subLessonsTitleDescription: "Opis Podrozdziału Poczatkujacy 4", typeOfTask: "A"),
    SubLessonsDataStruct(completion: false, subLessonsTitle: "Podrozdział Poczatkujacy 5", subLessonsTitleDescription: "Opis Podrozdziału Poczatkujacy 5", typeOfTask: "A"),
]
var podrozdzialyPoczatkujacy1 = [
    SubLessonsDataStruct(completion: false, subLessonsTitle: "Podrozdział Poczatkujacy 1", subLessonsTitleDescription: "Opis Podrozdziału Poczatkujacy 1", typeOfTask: "A"),
    SubLessonsDataStruct(completion: false, subLessonsTitle: "Podrozdział 2", subLessonsTitleDescription: "Opis Podrozdziału 2", typeOfTask: "A"),
    SubLessonsDataStruct(completion: false, subLessonsTitle: "Podrozdział 3", subLessonsTitleDescription: "Opis Podrozdziału 3", typeOfTask: "A"),
    SubLessonsDataStruct(completion: false, subLessonsTitle: "Podrozdział 4", subLessonsTitleDescription: "Opis Podrozdziału 4", typeOfTask: "A"),
    SubLessonsDataStruct(completion: false, subLessonsTitle: "Podrozdział 5", subLessonsTitleDescription: "Opis Podrozdziału 5", typeOfTask: "A"),
]
var podrozdzialyPoczatkujacy2 = [
    SubLessonsDataStruct(completion: false, subLessonsTitle: "Podrozdział Poczatkujacy 1", subLessonsTitleDescription: "Opis Podrozdziału Poczatkujacy 1", typeOfTask: "A"),
    SubLessonsDataStruct(completion: false, subLessonsTitle: "Podrozdział Poczatkujacy 2", subLessonsTitleDescription: "Opis Podrozdziału Poczatkujacy 2", typeOfTask: "A"),
    SubLessonsDataStruct(completion: false, subLessonsTitle: "Podrozdział 3", subLessonsTitleDescription: "Opis Podrozdziału 3", typeOfTask: "A"),
    SubLessonsDataStruct(completion: false, subLessonsTitle: "Podrozdział 4", subLessonsTitleDescription: "Opis Podrozdziału 4", typeOfTask: "A"),
    SubLessonsDataStruct(completion: false, subLessonsTitle: "Podrozdział 5", subLessonsTitleDescription: "Opis Podrozdziału 5", typeOfTask: "A"),
]
var podrozdzialyPoczatkujacy3 = [
    SubLessonsDataStruct(completion: false, subLessonsTitle: "Podrozdział Poczatkujacy 1", subLessonsTitleDescription: "Opis Podrozdziału Poczatkujacy 1", typeOfTask: "A"),
    SubLessonsDataStruct(completion: false, subLessonsTitle: "Podrozdział Poczatkujacy  2", subLessonsTitleDescription: "Opis PodrozdziałuPoczatkujacy 2", typeOfTask: "A"),
    SubLessonsDataStruct(completion: false, subLessonsTitle: "PodrozdziałPoczatkujacy 3", subLessonsTitleDescription: "Opis Podrozdziału Poczatkujacy 3", typeOfTask: "A"),
    SubLessonsDataStruct(completion: false, subLessonsTitle: "Podrozdział 4", subLessonsTitleDescription: "Opis Podrozdziału 4", typeOfTask: "A"),
    SubLessonsDataStruct(completion: false, subLessonsTitle: "Podrozdział 5", subLessonsTitleDescription: "Opis Podrozdziału 5", typeOfTask: "A"),
]


var podrozdzialySredniozaws = [
    SubLessonsDataStruct(completion: false, subLessonsTitle: "Podrozdział Sredniozaws 1", subLessonsTitleDescription: "Opis Podrozdziału Sredniozaws 1", typeOfTask: "A"),
    SubLessonsDataStruct(completion: false, subLessonsTitle: "Podrozdział Sredniozaws 2", subLessonsTitleDescription: "Opis Podrozdziału Sredniozaws 2", typeOfTask: "A"),
    SubLessonsDataStruct(completion: false, subLessonsTitle: "Podrozdział Sredniozaws 3", subLessonsTitleDescription: "Opis Podrozdziału Sredniozaws 3", typeOfTask: "A"),
    SubLessonsDataStruct(completion: false, subLessonsTitle: "Podrozdział Sredniozaws 4", subLessonsTitleDescription: "Opis Podrozdziału Sredniozaws 4", typeOfTask: "A"),
    SubLessonsDataStruct(completion: false, subLessonsTitle: "Podrozdział Sredniozaws 5", subLessonsTitleDescription: "Opis Podrozdziału Sredniozaws 5", typeOfTask: "A"),
]

var podrozdzialySredniozaws1 = [
    SubLessonsDataStruct(completion: false, subLessonsTitle: "Podrozdział Sredniozaws 1", subLessonsTitleDescription: "Opis Podrozdziału 1", typeOfTask: "A"),
    SubLessonsDataStruct(completion: false, subLessonsTitle: "Podrozdział Sredniozaws 2", subLessonsTitleDescription: "Opis Podrozdziału 2", typeOfTask: "A"),
    SubLessonsDataStruct(completion: false, subLessonsTitle: "Podrozdział 3", subLessonsTitleDescription: "Opis Podrozdziału 3", typeOfTask: "A"),
    SubLessonsDataStruct(completion: false, subLessonsTitle: "Podrozdział 4", subLessonsTitleDescription: "Opis Podrozdziału 4", typeOfTask: "A"),
    SubLessonsDataStruct(completion: false, subLessonsTitle: "Podrozdział 5", subLessonsTitleDescription: "Opis Podrozdziału 5", typeOfTask: "A"),
]

var podrozdzialySredniozaws2 = [
    SubLessonsDataStruct(completion: false, subLessonsTitle: "Podrozdział 1", subLessonsTitleDescription: "Opis Podrozdziału 1", typeOfTask: "A"),
    SubLessonsDataStruct(completion: false, subLessonsTitle: "Podrozdział 2", subLessonsTitleDescription: "Opis Podrozdziału 2", typeOfTask: "A"),
    SubLessonsDataStruct(completion: false, subLessonsTitle: "Podrozdział 3", subLessonsTitleDescription: "Opis Podrozdziału 3", typeOfTask: "A"),
    SubLessonsDataStruct(completion: false, subLessonsTitle: "Podrozdział 4", subLessonsTitleDescription: "Opis Podrozdziału 4", typeOfTask: "A"),
    SubLessonsDataStruct(completion: false, subLessonsTitle: "Podrozdział 5", subLessonsTitleDescription: "Opis Podrozdziału 5", typeOfTask: "A"),
]

var podrozdzialySredniozaws3 = [
    SubLessonsDataStruct(completion: false, subLessonsTitle: "Podrozdział 1", subLessonsTitleDescription: "Opis Podrozdziału 1", typeOfTask: "A"),
    SubLessonsDataStruct(completion: false, subLessonsTitle: "Podrozdział 2", subLessonsTitleDescription: "Opis Podrozdziału 2", typeOfTask: "A"),
    SubLessonsDataStruct(completion: false, subLessonsTitle: "Podrozdział 3", subLessonsTitleDescription: "Opis Podrozdziału 3", typeOfTask: "A"),
    SubLessonsDataStruct(completion: false, subLessonsTitle: "Podrozdział 4", subLessonsTitleDescription: "Opis Podrozdziału 4", typeOfTask: "A"),
    SubLessonsDataStruct(completion: false, subLessonsTitle: "Podrozdział 5", subLessonsTitleDescription: "Opis Podrozdziału 5", typeOfTask: "A"),
]

var podrozdzialySredniozaws4 = [
    SubLessonsDataStruct(completion: false, subLessonsTitle: "Podrozdział 1", subLessonsTitleDescription: "Opis Podrozdziału 1", typeOfTask: "A"),
    SubLessonsDataStruct(completion: false, subLessonsTitle: "Podrozdział 2", subLessonsTitleDescription: "Opis Podrozdziału 2", typeOfTask: "A"),
    SubLessonsDataStruct(completion: false, subLessonsTitle: "Podrozdział 3", subLessonsTitleDescription: "Opis Podrozdziału 3", typeOfTask: "A"),
    SubLessonsDataStruct(completion: false, subLessonsTitle: "Podrozdział 4", subLessonsTitleDescription: "Opis Podrozdziału 4", typeOfTask: "A"),
    SubLessonsDataStruct(completion: false, subLessonsTitle: "Podrozdział 5", subLessonsTitleDescription: "Opis Podrozdziału 5", typeOfTask: "A"),
]

var podrozdzialyZaawansowany = [
    SubLessonsDataStruct(completion: false, subLessonsTitle: "Podrozdział Zaawansowany0 1", subLessonsTitleDescription: "Opis Podrozdziału Zaawansowany0 1", typeOfTask: "A"),
    SubLessonsDataStruct(completion: false, subLessonsTitle: "Podrozdział 2", subLessonsTitleDescription: "Opis Podrozdziału 2", typeOfTask: "A"),
    SubLessonsDataStruct(completion: false, subLessonsTitle: "Podrozdział 3", subLessonsTitleDescription: "Opis Podrozdziału 3", typeOfTask: "A"),
    SubLessonsDataStruct(completion: false, subLessonsTitle: "Podrozdział 4", subLessonsTitleDescription: "Opis Podrozdziału 4", typeOfTask: "A"),
    SubLessonsDataStruct(completion: false, subLessonsTitle: "Podrozdział 5", subLessonsTitleDescription: "Opis Podrozdziału 5", typeOfTask: "A"),
]
var podrozdzialyZaawansowany1 = [
    SubLessonsDataStruct(completion: false, subLessonsTitle: "Podrozdział 1", subLessonsTitleDescription: "Opis Podrozdziału 1", typeOfTask: "A"),
    SubLessonsDataStruct(completion: false, subLessonsTitle: "Podrozdział 2", subLessonsTitleDescription: "Opis Podrozdziału 2", typeOfTask: "A"),
    SubLessonsDataStruct(completion: false, subLessonsTitle: "Podrozdział 3", subLessonsTitleDescription: "Opis Podrozdziału 3", typeOfTask: "A"),
    SubLessonsDataStruct(completion: false, subLessonsTitle: "Podrozdział Zaawansowany1 4", subLessonsTitleDescription: "Opis Podrozdziału Zaawansowany1 4", typeOfTask: "A"),
    SubLessonsDataStruct(completion: false, subLessonsTitle: "Podrozdział 5", subLessonsTitleDescription: "Opis Podrozdziału 5", typeOfTask: "A"),
]


var LessonsArrayDataStructDataPoczatkujacy = [LessonsDataStruct(completionCounter: 2, title: "Rozdział Poczatkujacy 1", subLessonsData: podrozdzialyPoczatkujacy),
                                              LessonsDataStruct(completionCounter: 1, title: "Rozdział Poczatkujacy 2", subLessonsData: podrozdzialyPoczatkujacy1),
                                              LessonsDataStruct(completionCounter: 1, title: "Rozdział Poczatkujacy 3", subLessonsData: podrozdzialyPoczatkujacy2),
                                              LessonsDataStruct(completionCounter: 2, title: "Rozdział Poczatkujacy 4", subLessonsData: podrozdzialyPoczatkujacy3),
]

var LessonsArrayDataStructDataSrednio = [LessonsDataStruct(completionCounter: 5, title: "Rozdział Srednio 1", subLessonsData: podrozdzialySredniozaws),
                                         LessonsDataStruct(completionCounter: 5, title: "Rozdział Srednio 2", subLessonsData: podrozdzialySredniozaws1),
                                         LessonsDataStruct(completionCounter: 5, title: "Rozdział Srednio 3", subLessonsData: podrozdzialySredniozaws2),
                                         LessonsDataStruct(completionCounter: 2, title: "Rozdział Srednio 4", subLessonsData: podrozdzialySredniozaws3),
                                         LessonsDataStruct(completionCounter: 3, title: "Rozdział Srednio 5", subLessonsData: podrozdzialySredniozaws4),
 LessonsDataStruct(completionCounter: 3, title: "Rozdział Srednio 6", subLessonsData: podrozdzialySredniozaws4),]

var LessonsArrayDataStructDataZaawansowany = [LessonsDataStruct(completionCounter: 1, title: "Rozdział Zaawansowany 1", subLessonsData: podrozdzialyZaawansowany),
                                              LessonsDataStruct(completionCounter: 1, title: "Rozdział Zaawansowany 2", subLessonsData: podrozdzialyZaawansowany1),
]


var rozdzialy = [LessonsStruct(isExpanded: false, title: "Początkujący", lessonsData: LessonsArrayDataStructDataPoczatkujacy),
                 LessonsStruct(isExpanded: true, title: "ŚrednioZaawansowany", lessonsData: LessonsArrayDataStructDataSrednio),
                 LessonsStruct(isExpanded: false, title: "Zaawansowany", lessonsData: LessonsArrayDataStructDataZaawansowany),
]



