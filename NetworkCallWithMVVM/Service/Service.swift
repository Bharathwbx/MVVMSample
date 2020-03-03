//
//  Service.swift
//  NetworkCallWithMVVM
//
//  Created by Bharatraj Rai on 3/3/20.
//  Copyright © 2020 Bharatraj Rai. All rights reserved.
//

import Foundation


class Service {
    static let shared = Service()
    
    func fetchCourse(completion: @escaping([Course]?, Error?) -> ()) {
        let urlString =  "https://api.letsbuildthatapp.com/jsondecodable/courses"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let err = error {
                completion(nil, error)
                print("Failed to fetch course...", err)
                return
            }
            guard let data = data else { return }
            do {
                let courses = try JSONDecoder().decode([Course].self, from: data)
                DispatchQueue.main.async {
                    completion(courses, nil)
                }
            } catch let jsonErr {
                print("Failed to decode:", jsonErr)
                
            }
        }.resume()
    }
}
