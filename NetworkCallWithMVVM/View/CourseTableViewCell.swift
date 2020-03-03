//
//  CourseTableViewCell.swift
//  NetworkCallWithMVVM
//
//  Created by Bharatraj Rai on 3/3/20.
//  Copyright © 2020 Bharatraj Rai. All rights reserved.
//

import Foundation
import UIKit


class CourseTableViewCell: UITableViewCell {
    
    var courseViewModel: CourseViewModel? {
        didSet {
            courseNameLabel.text = courseViewModel?.courseName
            courseDetailLabel.text = courseViewModel?.lessonDetailString
            accessoryType = courseViewModel?.accessoryType ?? .none
        }
    }
    
    let courseNameLabel: UILabel = {
       let label = UILabel()
        label.text = "Course"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .mainTextBlue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let courseDetailLabel: UILabel = {
        let label = UILabel()
         label.text = "Course Details"
         label.font = UIFont.boldSystemFont(ofSize: 12)
         label.textColor = .highlightColor
         label.translatesAutoresizingMaskIntoConstraints = false
         return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
                
        addSubview(courseNameLabel)
        courseNameLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        courseNameLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -30).isActive = true
        courseNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        
        addSubview(courseDetailLabel)
        courseDetailLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        courseDetailLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -30).isActive = true
        courseDetailLabel.topAnchor.constraint(equalTo: courseNameLabel.bottomAnchor, constant: 10).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
