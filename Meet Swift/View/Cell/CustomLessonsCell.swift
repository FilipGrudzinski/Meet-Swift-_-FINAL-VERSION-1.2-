//
//  CustomLessonsCell.swift
//  Meet Swift
//
//  Created by Filip on 12/01/2019.
//  Copyright © 2019 Filip. All rights reserved.
//

import UIKit

class CustomLessonsCell: UITableViewCell  {
    
    @IBOutlet weak var cell: UIView!
    
    
    let lessonsNumber:UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 17.0)
        // label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    let lessonsTitle:UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16.0)
        return label
    }()
    
    let progressLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12.0)
        return label
    }()
    
    let progressBar = UIProgressView()
    
   
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        
        progressBar.transform = progressBar.transform.scaledBy(x: 1, y: 1.2)
        progressBar.alpha = 0.7
        progressBar.layer.cornerRadius = 4
        progressBar.layer.masksToBounds = true
        
        lessonsNumber.translatesAutoresizingMaskIntoConstraints = false
        lessonsTitle.translatesAutoresizingMaskIntoConstraints = false
        progressLabel.translatesAutoresizingMaskIntoConstraints = false
        progressBar.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(lessonsNumber)
        contentView.addSubview(lessonsTitle)
        contentView.addSubview(progressLabel)
        contentView.addSubview(progressBar)
        
        let viewsDict = [
            
            "num" : lessonsNumber,
            "title" : lessonsTitle,
            "progress" : progressLabel,
            "bar" : progressBar,
            
            ]
        
        //h = horizontal - poziomy // v = vertical - pionowy
        
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[num(30)]-5-[title]-5-[progress]-16-|", options: [], metrics: nil, views: viewsDict))
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-21-[title]", options: [], metrics: nil, views: viewsDict))
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-20-[num]", options: [], metrics: nil, views: viewsDict))
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-21-[progress]", options: [], metrics: nil, views: viewsDict))
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[bar]-10-|", options: [], metrics: nil, views: viewsDict))
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-51-[bar]-16-|", options: [], metrics: nil, views: viewsDict))
        
     
    }
  
    
}
