//
//  ExtensionLessonVCSubViews.swift
//  Meet Swift
//
//  Created by Filip on 26/01/2019.
//  Copyright © 2019 Filip. All rights reserved.
//

import UIKit



extension LessonViewController {
    
    
  func showCorrectSubView() {
        
        correctSubView.alpha = 0
        UIView.animate(withDuration: 0.6, animations: {
            self.correctSubView.isHidden = false
            self.correctSubViewLabel.text = "Correct Answer Go To Next Lesson"
            self.hintSubView.isHidden = true
            self.incorrectSubView.isHidden = true
            self.correctSubView.alpha = 1
        })
        
        stuckTimer.invalidate()
        incorrectTimer.invalidate()
        hintTimer.invalidate()
        view.endEditing(true)
        
    }
    
    
    func showIncorectSubView() {
        
        incorrectSubView.alpha = 0
        UIView.animate(withDuration: 0.6, animations: {
            self.hintSubView.isHidden = true
            self.correctSubView.isHidden = true
            self.incorrectSubViewLabel.text = "Wrong Answer maybe you need a hint?"
            self.incorrectSubView.isHidden = false
            self.incorrectSubView.alpha = 1
            
        })
        
        incorrectTimer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(backToOryginalStage) , userInfo: nil, repeats: false)
        seconds = 65
        hintTimer.invalidate()
        
    }
    
    
    
     func showHintSubView() {
        
        hintSubView.alpha = 0
        UIView.animate(withDuration: 0.6, animations: {
            self.hintSubView.isHidden = false
            self.hintSubView.alpha = 1
            self.hintSubViewLabel.text = self.resultsLesson[self.indexesLesson[1]].subLessons[self.indexesLesson[2]].lessonHint
            self.incorrectSubView.isHidden = true
            self.correctSubView.isHidden = true
            self.descriptionLabel.isHidden = true
            
        })
        hintTimer = Timer.scheduledTimer(timeInterval: 15.0, target: self, selector: #selector(backToOryginalStage) , userInfo: nil, repeats: false)
        seconds = 75
        incorrectTimer.invalidate()
        
    }
    
    
    
    @objc func stuckTimerStage() {
        
        if seconds == 30 && seconds == 1 {
            
            incorrectSubView.alpha = 0
            UIView.animate(withDuration: 0.6, animations: {
                
                self.incorrectSubViewLabel.text = "Stuck? Maybe Need Help"
                self.incorrectSubView.isHidden = false
                self.incorrectSubView.alpha = 1
                
            })
            
            Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(backToOryginalStage) , userInfo: nil, repeats: false)
            
        } else if seconds == 0 {
            
            seconds = 60
            
        }
        
    }
    
    
    
    @objc func backToOryginalStage() {
        hintSubView.isHidden = true
        incorrectSubView.isHidden = true
        descriptionLabel.isHidden = false
    }
    
    
    
}
