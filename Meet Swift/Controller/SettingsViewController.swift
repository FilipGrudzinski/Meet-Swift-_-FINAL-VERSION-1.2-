//
//  SettingsViewController.swift
//  Meet Swift
//
//  Created by Filip on 04/01/2019.
//  Copyright © 2019 Filip. All rights reserved.
//

import UIKit



class SettingsViewController: UIViewController {
    
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
    
    @IBAction func colorThemeSwitch(_ sender: UISwitch) {
        
        Theme.current = sender.isOn ? DarkTheme() : LightTheme()
        UserDefaults.standard.set(sender.isOn, forKey: "Theme")
        applyTheme()
     
    }
    
    @IBAction func resetAllProgressButton(_ sender: UIButton) {
        print("Reset All Progress Button Pressed")
    }
    
    @IBAction func restoreInAppPurchaseButton(_ sender: UIButton) {
        print("Restore in-app pruchase Button Pressed")
    }

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
