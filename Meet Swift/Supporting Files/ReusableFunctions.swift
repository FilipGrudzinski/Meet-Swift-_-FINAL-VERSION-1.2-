////
////  NewModels.swift
////  Meet Swift
////
////  Created by Filip on 15/01/2019.
////  Copyright © 2019 Filip. All rights reserved.
////

import UIKit



public func setTitle(title:String, subtitle:String) -> UIView {
    let titleLabel = UILabel(frame: CGRect(x:0, y:4, width:0, height:0))
    
    titleLabel.textColor = Theme.current.textColor
    titleLabel.font = UIFont.boldSystemFont(ofSize: 17)
    titleLabel.text = title
    titleLabel.sizeToFit()
    
    
    let subtitleLabel = UILabel(frame: CGRect(x: UIScreen.main.bounds.width/2  , y: 5, width:0, height:30))
    
    
    subtitleLabel.textColor = Theme.current.textColor
    subtitleLabel.font = UIFont.systemFont(ofSize: 16.0)
    subtitleLabel.text = subtitle
    subtitleLabel.textAlignment = .left
    subtitleLabel.sizeToFit()
    
    let titleView = UIView(frame: CGRect(x:0, y:0, width:max(titleLabel.frame.size.width, subtitleLabel.frame.size.width), height:30))
    titleView.addSubview(titleLabel)
    titleView.addSubview(subtitleLabel)
    
    
    
    return titleView
}

