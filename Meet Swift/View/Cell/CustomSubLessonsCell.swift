//
//  CustomSubLessonsTableViewCell.swift
//  Meet Swift
//
//  Created by Filip on 11/01/2019.
//  Copyright © 2019 Filip. All rights reserved.
//

import UIKit

class CustomSubLessonsCell: UITableViewCell {
    
    
    let subLessonNumber:UILabel = {
        
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 17.0)
        return label
    }()
    
    let subLessonTitle:UILabel = {
        
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        return label
    }()
    
    let subLessonDescription: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16.0)
        return label
    }()
    
    
    let progressLabel = UILabel()
    let progressBar = UIProgressView()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
       
        
        subLessonNumber.translatesAutoresizingMaskIntoConstraints = false
        subLessonTitle.translatesAutoresizingMaskIntoConstraints = false
        subLessonDescription.translatesAutoresizingMaskIntoConstraints = false
        progressLabel.translatesAutoresizingMaskIntoConstraints = false
        //progressBar.translatesAutoresizingMaskIntoConstraints = true
        
        contentView.addSubview(subLessonNumber)
        contentView.addSubview(subLessonTitle)
        contentView.addSubview(subLessonDescription)
        contentView.addSubview(progressLabel)
        
        let viewsDict = [
            
            "subLesson" : subLessonNumber,
            "title" : subLessonTitle,
            "description" : subLessonDescription,
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
