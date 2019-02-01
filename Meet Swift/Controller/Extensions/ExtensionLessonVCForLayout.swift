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
        exampleTitle.textColor = Theme.current.textColor
        correctSubViewButton.tintColor = Theme.current.buttonColor
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
            lessonBPointA.isHidden = true
            lessonBPointB.isHidden = true
            lessonBPointC.isHidden = true
            lessonBAnswerA.isHidden = true
            lessonBAnswerB.isHidden = true
            lessonBAnswerC.isHidden = true
            
            createToolBarAboveKeyboardAndTextView()
            
            
            if resultsLesson[indexesLesson[1]].subLessons[indexesLesson[2]].userAnswer == nil || resultsLesson[indexesLesson[1]].subLessons[indexesLesson[2]].userAnswer?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            
                textView?.text = "enter your code here..."
            
            } else {
            
                textView?.attributedText = highlightr!.highlight(resultsLesson[indexesLesson[1]].subLessons[indexesLesson[2]].userAnswer!, as: "swift")
            
            }
        
            
            
            
        } else {
            
            //textView.removeFromSuperview()
            
            buttonALabel.isHidden = false
            buttonBLabel.isHidden = false
            buttonCLabel.isHidden = false
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
        
        
        
        if resultsLesson[indexesLesson[1]].subLessons[indexesLesson[2]].userAnswer?.trimmingCharacters(in: .whitespacesAndNewlines) != "" && resultsLesson[indexesLesson[1]].subLessons[indexesLesson[2]].userAnswer != nil  {

            textView.attributedText = highlightr!.highlight(resultsLesson[indexesLesson[1]].subLessons[indexesLesson[2]].userAnswer!, as: "swift")

        } else if textView.isFirstResponder {
        
            textView.text = nil
            
       }
    }
    
    func textViewDidEndEditing (_ textView: UITextView) {
        
        if textView.text.isEmpty || textView.text.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            textView.textColor = Theme.current.buttonColor
            textView.text = "enter your code here..."
            
        }
        
        
        
    }
    
    
    
    // MARK: - createToolBar function
    
    
    func createToolBar() {
        
        toolBar = UIToolbar()
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
        
        toolBar?.delegate = self
        toolBar?.setItems(buttonsArray, animated: true)
        toolBar?.tintColor = Theme.current.buttonColor
        toolBar?.barTintColor = Theme.current.navigationColor
        toolBar?.isTranslucent = true // Maybe  I will off this
        
        view.addSubview(toolBar!)
        

        
        toolBar?.translatesAutoresizingMaskIntoConstraints = false
        
        if #available(iOS 11.0, *) {
            let guide = self.view.safeAreaLayoutGuide
            toolBar?.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
            toolBar?.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
            toolBar?.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
            toolBar?.heightAnchor.constraint(equalToConstant: 44).isActive = true
            
        } else {
            NSLayoutConstraint(item: toolBar!, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1.0, constant: 0).isActive = true
            NSLayoutConstraint(item: toolBar!, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
            NSLayoutConstraint(item: toolBar!, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1.0, constant: 0).isActive = true
            
            toolBar?.heightAnchor.constraint(equalToConstant: 44).isActive = true
        }
        
    }
    
    
    
     // MARK: - createToolBarAboveKeyboardAndTextView function
    
    
    func createToolBarAboveKeyboardAndTextView() {
        
        
        
        let keyboardToolBar = UIToolbar()
        keyboardToolBar.sizeToFit()
        
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
        
        keyboardToolBar.setItems(buttonsArray, animated: true)
        keyboardToolBar.tintColor = Theme.current.buttonColor
        keyboardToolBar.barTintColor = Theme.current.navigationColor
        
        
        let textStorage = CodeAttributedString()
        textStorage.language = "Swift"
        textStorage.highlightr.setTheme(to: "atelier-cave-light")
        let layoutManager = NSLayoutManager()
        textStorage.addLayoutManager(layoutManager)
        
        let textContainer = NSTextContainer(size: view.bounds.size)
        layoutManager.addTextContainer(textContainer)
        
        textView = UITextView(frame: CGRect(x: 0, y: 80, width: UIScreen.main.bounds.width, height: 164), textContainer: textContainer)
        textView?.delegate = self
        textView?.inputAccessoryView = keyboardToolBar
        textView?.autocorrectionType = UITextAutocorrectionType.no
        textView?.autocapitalizationType = UITextAutocapitalizationType.none
        textView?.backgroundColor = Theme.current.selectedRow
        
        view.addSubview(textView!)
        
    }
    
    
    
}

