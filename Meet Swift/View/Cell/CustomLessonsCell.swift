//
//  CustomLessonsCell.swift
//  Meet Swift
//
//  Created by Filip on 12/01/2019.
//  Copyright © 2019 Filip. All rights reserved.
//

import UIKit

class CustomLessonsCell: UITableViewCell  {
    
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
        label.font = UIFont.systemFont(ofSize: 16.0)
        return label
    }()
    
    let progressBar = UIProgressView()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
       
        
        lessonsNumber.translatesAutoresizingMaskIntoConstraints = false
        lessonsTitle.translatesAutoresizingMaskIntoConstraints = false
       
        progressLabel.translatesAutoresizingMaskIntoConstraints = false
        progressBar.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(lessonsNumber)
        contentView.addSubview(lessonsTitle)
        contentView.addSubview(progressLabel)
        contentView.addSubview(progressBar)
        
        let viewsDict = [
            
            "subNum" : lessonsNumber,
            "title" : lessonsTitle,
            "progress" : progressLabel,
            "bar" : progressBar,
            
            ]
        
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[subNum(30)]-5-[title]-5-[progress]-16-|", options: [], metrics: nil, views: viewsDict))
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-21-[title]", options: [], metrics: nil, views: viewsDict))
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-20-[subNum]", options: [], metrics: nil, views: viewsDict))
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-21-[progress]", options: [], metrics: nil, views: viewsDict))
        
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[bar]-0-|", options: [], metrics: nil, views: viewsDict))
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[bar]-16-|", options: [], metrics: nil, views: viewsDict))
        
        //h = horizontal - poziomy
        // v = vertical - pionowy
        
       
      
        
    }
    

}
