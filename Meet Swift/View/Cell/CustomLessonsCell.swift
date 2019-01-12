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
        return label
    }()
    
    let lessonsTitle:UILabel = {
        
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        return label
    }()
    
    let lessonsDescription: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16.0)
        return label
    }()
    
    
    let progressLabel = UILabel()
    let progressBar = UIProgressView()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
        
        lessonsNumber.translatesAutoresizingMaskIntoConstraints = false
        lessonsTitle.translatesAutoresizingMaskIntoConstraints = false
        lessonsDescription.translatesAutoresizingMaskIntoConstraints = false
        progressLabel.translatesAutoresizingMaskIntoConstraints = false
        //progressBar.translatesAutoresizingMaskIntoConstraints = true
        
        contentView.addSubview(lessonsNumber)
        contentView.addSubview(lessonsTitle)
        contentView.addSubview(lessonsDescription)
        contentView.addSubview(progressLabel)
        
        
        let viewsDict = [
            
            "subLesson" : lessonsNumber,
            "title" : lessonsTitle,
            "description" : lessonsDescription,
            "progress" : progressLabel,
            
            ]
        
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[subLesson(14)]-10-[title]-0-[progress]-16-|", options: [], metrics: nil, views: viewsDict))
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-[title]-5-[description]-|", options: [], metrics: nil, views: viewsDict))
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-40-[description]-0-|", options: [], metrics: nil, views: viewsDict))
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-16-[subLesson]", options: [], metrics: nil, views: viewsDict))
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-16-[progress]", options: [], metrics: nil, views: viewsDict))
        
        //h = horizontal - poziomy
        // v = vertical - pionowy
        
       
      
        
    }
    


}
