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
    
    
   
     // MARK: - IBOutlet
    
    
    @IBOutlet weak var darkModeLabel: UILabel!
    @IBOutlet weak var darkModeSwitchOutlet: UISwitch!
    @IBOutlet weak var resetAllProgressButtonLabel: UIButton!
    @IBOutlet weak var restoreInAppPurchaseButtonLabel: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        
        let defaultRealmPath = Realm.Configuration.defaultConfiguration.fileURL!
        let bundleRealmPath = Bundle.main.url(forResource: "default", withExtension: "realm")
        
        try! FileManager.default.removeItem(at: Realm.Configuration.defaultConfiguration.fileURL!)
        
        do {
            try FileManager.default.copyItem(at: bundleRealmPath!, to: defaultRealmPath)
        } catch let error {
            print("error copying seeds: \(error)")
        }
        
    }
    
    
    @IBAction func restoreInAppPurchaseButton(_ sender: UIButton) {
        print("Restore in-app pruchase Button Pressed")
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
