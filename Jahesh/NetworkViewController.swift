//
//  NetworkViewController.swift
//  Jahesh
//
//  Created by Arash Farahani on 4/20/17.
//  Copyright © 2017 Arash Farahani. All rights reserved.
//

import Foundation
import UIKit

class NetworkViewController: UIViewController {
    
    var tableView: UITableView!
    var movies: [Movie] = [Movie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView = UITableView()
        tableView.contentInset = .zero
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(MovieCell.self, forCellReuseIdentifier: "MovieCell")
        //tableView.registerClass(NothingCell.self, forCellReuseIdentifier: "NothingCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        let tableViewLayoutConstraint = [
            NSLayoutConstraint(item: tableView, attribute: .leading, relatedBy: .equal, toItem: tableView.superview, attribute: .leading, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: tableView, attribute: .trailing, relatedBy: .equal, toItem: tableView.superview, attribute: .trailing, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: tableView, attribute: .top, relatedBy: .equal, toItem: tableView.superview, attribute: .top, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: tableView, attribute: .bottom, relatedBy: .equal, toItem: tableView.superview, attribute: .bottom, multiplier: 1, constant: 0)
        ]
        view.addConstraints(tableViewLayoutConstraint)
        
        callMoviesAPI()
    }
    
    func callMoviesAPI() {
        let url = URL(string: "http://moviesapi.ir/api/v1/movies?page=0")
        
        let task = URLSession.shared.dataTask(with: url!) { data, response, error in
            guard error == nil else {
                print(error!)
                return
            }
            
            guard let data = data else {
                print("Data is empty")
                return
            }
            
            let json = try! JSONSerialization.jsonObject(with: data, options: [])
            print(json)
            
            if let dictionary = json as? [String: Any] {
                if let metadata = dictionary["metadata"] as? [String: Any] {
                    // access individual value in dictionary
                    if let currentPage = metadata["current_page"] as? Int {
                        print(currentPage)
                    }
                }
                
                
                
                if let data = dictionary["data"] as? [Any] {
                    
                    for movie in data {
                        if let dicMovie = movie as? [String: Any] {
                            let movieObj = Movie()
                            movieObj.id = dicMovie["id"] as! Int
                            movieObj.poster = dicMovie["poster"] as! String
                            movieObj.title = dicMovie["title"] as! String
                            //movie.genre =
                            self.movies.append(movieObj)
                        }
                        
                    }
                    
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
            }
            
            let currentPage = ((json as! [String: Any])["metadata"] as! [String: Any])["current_page"] as! Int // code eshtebah ast khatare marg
            
            //let currentPage = .......
            //print(currentPage)
        }
        
        task.resume() // khaili moheme ino nazarid kar nemikone
        
    }
    
}
extension NetworkViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return movies.count
    }
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        cell.configure(movie: movies[indexPath.row])
        return cell
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }
    
}
extension NetworkViewController: UITableViewDelegate {
    
    // Display customization
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    
    //func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
    //
    //}
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
