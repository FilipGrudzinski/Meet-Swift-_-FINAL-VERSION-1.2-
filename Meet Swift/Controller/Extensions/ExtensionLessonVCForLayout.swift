//
//  ExtensionToolBarForLessonVC.swift
//  Meet Swift
//
//  Created by Filip on 24/01/2019.
//  Copyright © 2019 Filip. All rights reserved.
//

import UIKit
import Highlightr



extension LessonViewController {
    
    
    func setLessonNavBar() {
        
        navigationItem.title = "\(resultsLesson[indexesLesson[1]].subLessons[indexesLesson[2]].subLessonsTitle)"
        
        let rightBtt = UIButton(type: .system)
        rightBtt.isUserInteractionEnabled = false
        rightBtt.tintColor = Theme.current.textColor
        rightBtt.setTitle("\(indexesLesson[2] + 1)/\(resultsLesson[indexesLesson[1]].subLessons.count)", for: .normal)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightBtt)
        
    }
    
    
    // MARK: - Theme function
    
    
    func applyLessonTheme() {
        
        view.backgroundColor = Theme.current.viewControllerBackgroundColor
        descriptionLabel.textColor = Theme.current.textColor
        exampleLabel.textColor = Theme.current.textColor
        textView.backgroundColor = Theme.current.selectedRow
        
        buttonCLabel.tintColor = Theme.current.viewControllerBackgroundColor
        buttonBLabel.tintColor = Theme.current.viewControllerBackgroundColor
        buttonALabel.tintColor = Theme.current.viewControllerBackgroundColor
        buttonCLabel.backgroundColor = Theme.current.buttonColor
        buttonBLabel.backgroundColor = Theme.current.buttonColor
        buttonALabel.backgroundColor = Theme.current.buttonColor
        
        
        lessonBPointA.textColor = Theme.current.textColor
        lessonBPointB.textColor = Theme.current.textColor
        lessonBPointC.textColor = Theme.current.textColor
        
        hintSubViewButtonLabel.tintColor = Theme.current.buttonColor
        hintSubViewLabel.textColor = Theme.current.textColor
        hintSubView.backgroundColor = Theme.current.selectedRow
        
        correctSubViewLabel.textColor = Theme.current.textColor
        correctSubViewButton.tintColor = Theme.current.buttonColor
        
        incorrectSubViewLabel.textColor = Theme.current.textColor
        incorrectSubViewSubViewButtonLabel.tintColor = Theme.current.buttonColor
        
    }
    
    
    func layoutLessonSetUp() {
        
        hintSubView.isHidden = true
        correctSubView.isHidden = true
        incorrectSubView.isHidden = true
        
        
        if resultsLesson[indexesLesson[1]].subLessons[indexesLesson[2]].typeOfTask == "A" {
            
            buttonALabel.isHidden = true
            buttonBLabel.isHidden = true
            buttonCLabel.isHidden = true
            textView.isHidden = true
            lessonBPointA.isHidden = true
            lessonBPointB.isHidden = true
            lessonBPointC.isHidden = true
            lessonBAnswerA.isHidden = true
            lessonBAnswerB.isHidden = true
            lessonBAnswerC.isHidden = true
            
            
            
            let highlightr = Highlightr()
            highlightr?.setTheme(to: "paraiso-dark")
            
            let code = "let b: Int = 5"
            //let code = resultsLesson[indexesLesson[1]].subLessons[indexesLesson[2]].lessonExample
            // You can omit the second parameter to use automatic language detection.
            let highlightedCode = highlightr!.highlight(code, as: "swift")
            
            descriptionLabel.attributedText = highlightedCode
            
            
            let textStorage = CodeAttributedString()
            textStorage.language = "Swift"
            
            let layoutManager = NSLayoutManager()
            textStorage.addLayoutManager(layoutManager)
            
            let textContainer = NSTextContainer(size: view.bounds.size)
            layoutManager.addTextContainer(textContainer)
            
            let textView2 = UITextView(frame: CGRect(x: 0, y: 80, width: UIScreen.main.bounds.width, height: 168), textContainer: textContainer)
            
            view.addSubview(textView2)
            
            if (resultsLesson[indexesLesson[1]].subLessons[indexesLesson[2]].userAnswer)?.trimmingCharacters(in: .whitespacesAndNewlines) != ""  {
                textView2.text = resultsLesson[indexesLesson[1]].subLessons[indexesLesson[2]].userAnswer
                textView2.backgroundColor = Theme.current.selectedRow
            } else {
                textView2.text = "Enter your code here..."
            }
            
            textView2.textColor = Theme.current.buttonColor
            
            createToolBarAboveKeyboard()
            
        } else {
            
            buttonALabel.isHidden = false
            buttonBLabel.isHidden = false
            buttonCLabel.isHidden = false
            textView.isHidden = true
            
            lessonBPointA.isHidden = false
            lessonBPointB.isHidden = false
            lessonBPointC.isHidden = false
            lessonBAnswerA.isHidden = false
            lessonBAnswerB.isHidden = false
            lessonBAnswerC.isHidden = false
            
            exampleLabel.isHidden = true
            exampleTitle.isHidden = true
            buttonALabel.layer.cornerRadius = 6
            buttonBLabel.layer.cornerRadius = 6
            buttonCLabel.layer.cornerRadius = 6
            buttonALabel.layer.masksToBounds = true
            buttonBLabel.layer.masksToBounds = true
            buttonCLabel.layer.masksToBounds = true
            
        }
        
    }
    
    
    func textViewDidBeginEditing (_ textView: UITextView) {
        
        if resultsLesson[indexesLesson[1]].subLessons[indexesLesson[2]].userAnswer != ""  {
            
            textView2.text = resultsLesson[indexesLesson[1]].subLessons[indexesLesson[2]].userAnswer
            
        } else  if textView2.textColor == Theme.current.buttonColor && textView2.isFirstResponder {
            textView2.text = nil
            textView2.textColor = Theme.current.textColor
        }
    }
    
    func textViewDidEndEditing (_ textView: UITextView) {
        
        if textView2.text.isEmpty || textView2.text == "" {
            textView2.textColor = Theme.current.buttonColor
            textView2.text = "Enter your code here..."
            
        }
        
    }
    
    
    
    func createToolBar() {
        
        let toolBar = UIToolbar()
        var buttonsArray = [UIBarButtonItem]()
        
        buttonsArray.append(
            UIBarButtonItem(title: "Previous", style: .plain, target: self, action: #selector(previousButtonAction))
        )
        
        buttonsArray.append( UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil) )
        
        
        buttonsArray.append(
            UIBarButtonItem(title: "Hint", style: .plain, target: self, action: #selector(hintButtonAction))
            
        )
        
        if resultsLesson[indexesLesson[1]].subLessons[indexesLesson[2]].typeOfTask == "A" {
            
            buttonsArray.append( UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil) )
            
            
            buttonsArray.append(
                UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.play, target: self, action: #selector(checkButtonAction))
            )
        }
        
        
        toolBar.setItems(buttonsArray, animated: true)
        toolBar.tintColor = Theme.current.buttonColor
        toolBar.barTintColor = Theme.current.navigationColor
        toolBar.isTranslucent = true // Maybe  I will off this
        
        view.addSubview(toolBar)
        
        
        // MARK: - Constraint settup
        
        toolBar.translatesAutoresizingMaskIntoConstraints = false
        
        if #available(iOS 11.0, *) {
            let guide = self.view.safeAreaLayoutGuide
            toolBar.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
            toolBar.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
            toolBar.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
            toolBar.heightAnchor.constraint(equalToConstant: 44).isActive = true
            
        } else {
            NSLayoutConstraint(item: toolBar, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1.0, constant: 0).isActive = true
            NSLayoutConstraint(item: toolBar, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
            NSLayoutConstraint(item: toolBar, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1.0, constant: 0).isActive = true
            
            toolBar.heightAnchor.constraint(equalToConstant: 44).isActive = true
        }
        
    }
    
    
    
    func createToolBarAboveKeyboard() {
        
        
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        var buttonsArray = [UIBarButtonItem]()
        buttonsArray.append(
            UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneButtonAction))
        )
        
        buttonsArray.append( UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil) )
        
        buttonsArray.append(
            UIBarButtonItem(title: "Hint", style: .plain, target: self, action: #selector(hintButtonAction))
        )
        
        buttonsArray.append( UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil) )
        
        buttonsArray.append(
            UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.play, target: self, action: #selector(checkButtonAction))
        )
        
        toolBar.setItems(buttonsArray, animated: true)
        toolBar.tintColor = Theme.current.buttonColor
        toolBar.barTintColor = Theme.current.navigationColor
        
        textView.inputAccessoryView = toolBar
        
        
    }
    
    
}

