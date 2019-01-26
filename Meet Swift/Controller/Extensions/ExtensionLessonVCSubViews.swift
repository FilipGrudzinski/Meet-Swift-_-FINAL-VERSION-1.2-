//
//  ExtensionLessonVCSubViews.swift
//  Meet Swift
//
//  Created by Filip on 26/01/2019.
//  Copyright © 2019 Filip. All rights reserved.
//

import UIKit



extension LessonViewController {
    
    
    
    @objc func showIncorectSubView() {
        
        incorectSubView.alpha = 0
        UIView.animate(withDuration: 0.6, animations: {
            self.hintSubView.isHidden = true
            self.correctSubView.isHidden = true
            self.incorectSubViewLabel.text = "Wrong Answer maybe you need a hint?"
            self.incorectSubView.isHidden = false
            self.incorectSubView.alpha = 1
            
        })
        
        Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(backToOryginalStage) , userInfo: nil, repeats: false)
        seconds = 65
        
    }
    
    
    
     func showHintSubView() {
        
        hintSubView.alpha = 0
        UIView.animate(withDuration: 0.6, animations: {
            self.hintSubView.isHidden = false
            self.hintSubView.alpha = 1
            self.hintSubViewLabel.text = "Przykładowy tekst podpowiedzi"
            //self.hintSubViewLabel.text = resultsLesson[indexesLesson[0]].subLessons[indexesLesson[1]].lessonHint
            self.incorectSubView.isHidden = true
            self.correctSubView.isHidden = true
            self.descriptionLabel.isHidden = true
            
        })
        
        Timer.scheduledTimer(timeInterval: 15.0, target: self, selector: #selector(backToOryginalStage) , userInfo: nil, repeats: false)
        seconds = 75
        
    }
    
    
    
    @objc func stuckTimerStage() {
        
        if seconds == 30 && seconds == 1 {
            
            incorectSubView.alpha = 0
            UIView.animate(withDuration: 0.6, animations: {
                
                self.incorectSubViewLabel.text = "Stuck? Maybe Need Help"
                self.incorectSubView.isHidden = false
                self.incorectSubView.alpha = 1
                
            })
            
            Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(backToOryginalStage) , userInfo: nil, repeats: false)
            
        } else if seconds == 0 {
            
            seconds = 60
            
        }
        
    }
    
    
    
    @objc func backToOryginalStage() {
        hintSubView.isHidden = true
        //correctSubView.isHidden = true
        incorectSubView.isHidden = true
        descriptionLabel.isHidden = false
    }
    
    
    
}
