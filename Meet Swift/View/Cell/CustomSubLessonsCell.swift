//
//  CustomSubLessonsTableViewCell.swift
//  Meet Swift
//
//  Created by Filip on 11/01/2019.
//  Copyright © 2019 Filip. All rights reserved.
//

import UIKit



class CustomSubLessonsCell: UITableViewCell {
    
    
    
    let subLessonsNumber:UILabel = {
        
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 17.0)
        return label
    }()
    
    let subLessonsTitle:UILabel = {
        
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16.0)
        return label
    }()
    
    let subLessonsDescription: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10.0)
        return label
    }()
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        subLessonsNumber.translatesAutoresizingMaskIntoConstraints = false
        subLessonsTitle.translatesAutoresizingMaskIntoConstraints = false
        subLessonsDescription.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(subLessonsNumber)
        contentView.addSubview(subLessonsTitle)
        contentView.addSubview(subLessonsDescription)
        
        let viewsDict = [
            
            "subNum" : subLessonsNumber,
            "title" : subLessonsTitle,
            "description" : subLessonsDescription,
            
            ]
        
        //h = horizontal - poziomy // v = vertical - pionowy
        
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[subNum(30)]-5-[title]-40-|", options: [], metrics: nil, views: viewsDict))
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-21-[title]-2-[description]", options: [], metrics: nil, views: viewsDict))
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-20-[subNum]", options: [], metrics: nil, views: viewsDict))
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-51-[description]-40-|", options: [], metrics: nil, views: viewsDict))
 
        
    }
    
    
}
