//
//  ExtensionToolBarForLessonVC.swift
//  Meet Swift
//
//  Created by Filip on 24/01/2019.
//  Copyright © 2019 Filip. All rights reserved.
//

import UIKit



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
        lessonTaskBLabel.backgroundColor = Theme.current.selectedRow
        lessonTaskBLabel.textColor = Theme.current.textColor
        buttonCLabel.tintColor = Theme.current.viewControllerBackgroundColor
        buttonBLabel.tintColor = Theme.current.viewControllerBackgroundColor
        buttonALabel.tintColor = Theme.current.viewControllerBackgroundColor
        buttonCLabel.backgroundColor = Theme.current.buttonColor
        buttonBLabel.backgroundColor = Theme.current.buttonColor
        buttonALabel.backgroundColor = Theme.current.buttonColor
        
        
    }
    
    
     func layoutLessonSetUp() {
        
        if resultsLesson[indexesLesson[1]].subLessons[indexesLesson[2]].typeOfTask == "A" {
            
            buttonALabel.isHidden = true
            buttonBLabel.isHidden = true
            buttonCLabel.isHidden = true
            textView.isHidden = false
            lessonTaskBLabel.isHidden = true
            descriptionLabel.isHidden = false
            
            textView.text = "Enter your code here..."
            textView.textColor = Theme.current.buttonColor
            
            createToolBarAboveKeyboard()
            
        } else {
            
            buttonALabel.isHidden = false
            buttonBLabel.isHidden = false
            buttonCLabel.isHidden = false
            textView.isHidden = true
            lessonTaskBLabel.isHidden = false
            descriptionLabel.isHidden = true
            buttonALabel.layer.cornerRadius = 6
            buttonBLabel.layer.cornerRadius = 6
            buttonCLabel.layer.cornerRadius = 6
            
            buttonALabel.layer.masksToBounds = true
            buttonBLabel.layer.masksToBounds = true
            buttonCLabel.layer.masksToBounds = true
            
        }
        
        
    }
    
    
    func textViewDidBeginEditing (_ textView: UITextView) {
        if textView.textColor == Theme.current.buttonColor && textView.isFirstResponder {
            textView.text = nil
            textView.textColor = Theme.current.textColor
        }
    }
    
    func textViewDidEndEditing (_ textView: UITextView) {
        
        if textView.text.isEmpty || textView.text == "" {
            textView.textColor = Theme.current.buttonColor
            textView.text = "Enter your code here..."
        }
        
        
    }
    
    
    
    func createToolBar() {
        
        let toolBar = UIToolbar()
        
        var buttonsArray = [UIBarButtonItem]()
        
        buttonsArray.append(
            UIBarButtonItem(title: "Previous", style: .plain, target: self, action: #selector(previousButtonAction))
        )
        
        buttonsArray.append(
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        )
        
        
        buttonsArray.append(
            UIBarButtonItem(title: "Hint", style: .plain, target: self, action: #selector(hintButtonAction))
        )
        
        buttonsArray.append(
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        )
        
        buttonsArray.append(
            UIBarButtonItem(title: "Check", style: .plain, target: self, action: #selector(checkButtonAction))
        )
        
        toolBar.setItems(buttonsArray, animated: true)
        toolBar.tintColor = Theme.current.buttonColor
        toolBar.barTintColor = Theme.current.navigationColor
        toolBar.isTranslucent = false
        toolBar.setShadowImage(UIImage(), forToolbarPosition: .bottom)
        
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
        
        buttonsArray.append(
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        )
        
        buttonsArray.append(
            UIBarButtonItem(title: "Hint", style: .plain, target: self, action: #selector(hintButtonAction))
        )
        
        buttonsArray.append(
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        )
        
        buttonsArray.append(
            UIBarButtonItem(title: "Check", style: .plain, target: self, action: #selector(checkButtonAction))
        )
        
        toolBar.setItems(buttonsArray, animated: true)
        
        
        textView.inputAccessoryView = toolBar
        
        
    }
    
    
}

