//
//  LessonBViewController.swift
//  Meet Swift
//
//  Created by Filip on 17/01/2019.
//  Copyright © 2019 Filip. All rights reserved.
//

import UIKit

var lessonBTitle = ""

class LessonBViewController: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.title = lessonBTitle
        
        let headerCounterLabel: UILabel = {
            let label = UILabel()
            label.frame = CGRect(x: UIScreen.main.bounds.width - 50, y: 4, width: 50, height: 35)
            label.font = UIFont.systemFont(ofSize: 14.0)
            label.text = "Lekcja B"
            label.textColor = Theme.current.textColor
            return label
        }()
        // Do any additional setup after loading the view.
        
        view.addSubview(headerCounterLabel)
        view.backgroundColor = Theme.current.viewControllerBackgroundColor
    }
 
    private func applyTheme() {
        
        view.backgroundColor = Theme.current.viewControllerBackgroundColor
        //exampleLabel.textColor = Theme.current.buttonColor
        
    }
}
