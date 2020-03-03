//
//  CoursesController.swift
//  NetworkCallWithMVVM
//
//  Created by Bharatraj Rai on 3/3/20.
//  Copyright © 2020 Bharatraj Rai. All rights reserved.
//

import Foundation
import UIKit


class CoursesController: UITableViewController {
    
    var courseViewModel = [CourseViewModel]()
    let cellID = "cellID"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initializeTableView()
        setupNavigationBar()
        fetchData()
    }
    
    func initializeTableView() {
        view.backgroundColor = .darkBlue
        tableView.register(CourseTableViewCell.self, forCellReuseIdentifier: cellID)
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 24)
        tableView.separatorColor = .mainTextBlue
        tableView.tableFooterView = UIView()
    }
    
    func setupNavigationBar() {
        navigationItem.title = "Courses"
        navigationController?.setupNavigationalController()
    }
    
    func fetchData() {
        Service.shared.fetchCourse { [weak self] (courses, error) in
            if let err = error {
                print("Failed to fetch data from service : ", err)
                return
            }
            self?.courseViewModel = courses?.map({ return CourseViewModel(course: $0)}) ?? []
            self?.tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courseViewModel.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as? CourseTableViewCell else { return UITableViewCell() }
        cell.courseViewModel = courseViewModel[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}




