//
//  LessonViewController.swift
//  Meet Swift
//
//  Created by Filip on 10/12/2018.
//  Copyright © 2018 Filip. All rights reserved.
//

import UIKit

var lessonTitle = ""

class LessonViewController: UIViewController {
    
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var exampleLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        applyTheme()
        self.title = lessonTitle

        
    }

    
    @IBOutlet weak var previousButton: UIToolbar!
    
    @IBAction func checkButton(_ sender: UIBarButtonItem) {
    }
    @IBAction func hintButton(_ sender: UIBarButtonItem) {
    }
    
    
    
    private func applyTheme() {
        
        navigationController?.navigationBar.barStyle = Theme.current.style
        navigationController?.navigationBar.tintColor = Theme.current.buttonColor // color of navigationbar buttons
        navigationController?.navigationBar.barTintColor = Theme.current.navigationColor // color of navigationbar
        view.backgroundColor = Theme.current.viewControllerBackgroundColor
        descriptionLabel.textColor = Theme.current.textColor
        exampleLabel.textColor = Theme.current.buttonColor
        
    }
    
}
