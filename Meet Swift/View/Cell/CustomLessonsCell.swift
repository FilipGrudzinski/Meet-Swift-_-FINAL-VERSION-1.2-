//
//  CustomLessonsCell.swift
//  Meet Swift
//
//  Created by Filip on 10/01/2019.
//  Copyright © 2019 Filip. All rights reserved.
//

import UIKit

class CustomLessonsCell: UITableViewCell {

    @IBOutlet weak var lessonsNumberLabel: UILabel!
    @IBOutlet weak var lessonsTitleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var lessonsProgressLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        setTheme(isDark: mode)
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
        // Configure the view for the selected state
    }
    
    func setTheme(isDark: Bool) {
        
        let theme = isDark ? ColorTheme.dark : ColorTheme.light
        
        lessonsNumberLabel.textColor = theme.textColor
        lessonsTitleLabel.textColor = theme.textColor
        lessonsProgressLabel.textColor = theme.textColor
        progressBar.progressTintColor = theme.cellProgressBarColor
        
        //UITableViewCell.appearance().selectedBackgroundView?.backgroundColor = theme.selectedRow
        
    }

}
