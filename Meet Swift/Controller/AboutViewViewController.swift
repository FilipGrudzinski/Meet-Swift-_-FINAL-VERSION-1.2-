//
//  AboutViewViewController.swift
//  Meet Swift
//
//  Created by Filip on 04/01/2019.
//  Copyright © 2019 Filip. All rights reserved.
//

import UIKit
import MessageUI



class AboutViewViewController: UIViewController, MFMailComposeViewControllerDelegate {
    
    
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var contaktLabelContent: UILabel!
    @IBOutlet weak var autorLabel: UILabel!
    @IBOutlet weak var autorLabelContent: UILabel!
    @IBOutlet weak var contactLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(AboutViewViewController.tapFunction))
        contaktLabelContent.isUserInteractionEnabled = true
        contaktLabelContent.addGestureRecognizer(tap)
        applyTheme()
        // Do any additional setup after loading the view.
    }
    
    @objc func tapFunction(sender:UITapGestureRecognizer) {
        
        let email = "grufil.apps@gmail.com"
        let subject = "Meet Swift App Contact - Subject"
        let bodyText = "Please provide information that will help us to serve you better"
        
        if MFMailComposeViewController.canSendMail() {
            
            let mailComposerVC = MFMailComposeViewController()
            mailComposerVC.mailComposeDelegate = self
            mailComposerVC.setToRecipients([email])
            mailComposerVC.setSubject(subject)
            mailComposerVC.setMessageBody(bodyText, isHTML: true)
            self.present(mailComposerVC, animated: true, completion: nil)
            
        } else {
            let coded = "mailto:\(email)?subject=\(subject)&body=\(bodyText)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
            if let emailURL = URL(string: coded!)
            {
                if UIApplication.shared.canOpenURL(emailURL)
                {
                    UIApplication.shared.open(emailURL, options: [:], completionHandler: { (result) in
                        if !result {
                            // show some Toast or error alert
                            //("Your device is not currently configured to send mail.")
                        }
                    })
                }
            }
            
        }
        
    }
    
    
    //MARK: MFMailComposeViewControllerDelegate Method
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Theme function
    
    
    private func applyTheme() {

        view.backgroundColor = Theme.current.viewControllerBackgroundColor
        descriptionLabel.textColor = Theme.current.textColor
        autorLabel.textColor = Theme.current.textColor
        autorLabelContent.textColor = Theme.current.textColor
        contactLabel.textColor = Theme.current.textColor
        contaktLabelContent.textColor = Theme.current.buttonColor
    }
    
}
