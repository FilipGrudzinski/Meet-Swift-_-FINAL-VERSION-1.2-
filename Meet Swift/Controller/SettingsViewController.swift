//
//  SettingsViewController.swift
//  Meet Swift
//
//  Created by Filip on 04/01/2019.
//  Copyright © 2019 Filip. All rights reserved.
//

import UIKit
import RealmSwift


class SettingsViewController: UIViewController {
    
    
    lazy var realm = try! Realm()
    var resultsOfCollectionOfLessons: Results<CollectionOfLessons>!
    
    
    @IBOutlet weak var darkModeLabel: UILabel!
    @IBOutlet weak var darkModeSwitchOutlet: UISwitch!
    @IBOutlet weak var resetAllProgressButtonLabel: UIButton!
    @IBOutlet weak var restoreInAppPurchaseButtonLabel: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadItems()
        //resetAllProgressButtonLabel.isHidden = true
        //restoreInAppPurchaseButtonLabel.isHidden = true
        
        let modeValue = UserDefaults.standard.bool(forKey: "Theme")
        darkModeSwitchOutlet.setOn(modeValue, animated: false)
        applyTheme()
        
    }
    
    
    // MARK: - IBAction
    
    
    @IBAction func colorThemeSwitch(_ sender: UISwitch) {
        
        Theme.current = sender.isOn ? DarkTheme() : LightTheme()
        UserDefaults.standard.set(sender.isOn, forKey: "Theme")
        applyTheme()
     
    }
    
    
    @IBAction func resetAllProgressButton(_ sender: UIButton) {
        print("Reset All Progress Button Pressed")
        
        var collections = 0
        for _ in resultsOfCollectionOfLessons {
            
            let countOfLessonsInCollectionOfLessons = resultsOfCollectionOfLessons[collections].lessons.count
            
            for lessons in 0..<countOfLessonsInCollectionOfLessons {
                
                print(lessons)
                let countOfSubLessonsInLessons = resultsOfCollectionOfLessons[collections].lessons[lessons].subLessons.count
                
                for subLessons in 0..<countOfSubLessonsInLessons {
                    
                    try! realm.write {
                        resultsOfCollectionOfLessons[collections].lessons[lessons].subLessons[subLessons].completion = false
                        resultsOfCollectionOfLessons[collections].lessons[lessons].subLessons[subLessons].userAnswer = nil
                        
                    }
                    
                }
                
            }
            collections += 1
            }
        
    }
    

    @IBAction func restoreInAppPurchaseButton(_ sender: UIButton) {
        print("Restore in-app pruchase Button Pressed")
    }

    
    private func loadItems() {
        
        resultsOfCollectionOfLessons = realm.objects(CollectionOfLessons.self)
        
    }
    
    // MARK: - Theme function
    
    private func applyTheme() {
        
        navigationController?.navigationBar.barStyle = Theme.current.style
        navigationController?.navigationBar.tintColor = Theme.current.buttonColor // color of navigationbar buttons
        navigationController?.navigationBar.barTintColor = Theme.current.navigationColor // color of navigationbar
        view.backgroundColor = Theme.current.viewControllerBackgroundColor
        darkModeLabel.textColor = Theme.current.textColor
        resetAllProgressButtonLabel.tintColor = Theme.current.buttonColor
        restoreInAppPurchaseButtonLabel.tintColor = Theme.current.buttonColor
        
    }
    
    
    
    
}
