//
//  CourseViewModel.swift
//  NetworkCallWithMVVM
//
//  Created by Bharatraj Rai on 3/3/20.
//  Copyright © 2020 Bharatraj Rai. All rights reserved.
//

import Foundation
import UIKit

struct CourseViewModel {
    let courseName: String
    let lessonDetailString: String
    let accessoryType: UITableViewCell.AccessoryType
    
    init(course: Course) {
        self.courseName = course.name
        if course.number_of_lessons > 35 {
            lessonDetailString = "Lesson 30+ Check it out!"
            accessoryType = .detailDisclosureButton
        } else {
            lessonDetailString = "Lessons : \(course.number_of_lessons)"
            accessoryType = .none
        }
    }
}
