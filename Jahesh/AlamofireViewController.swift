//
//  AlamofireViewController.swift
//  Jahesh
//
//  Created by Arash Farahani on 4/21/17.
//  Copyright © 2017 Arash Farahani. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper

class AlamofireViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var tableView: UITableView!
    var movies = [Movie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView = UITableView()
        tableView.register(AlamofireCell.self, forCellReuseIdentifier: "AlamofireCell")
        tableView.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
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
        Alamofire.request("http://moviesapi.ir/api/v1/movies?page=0").responseString { response in
            print(response.result)   // result of response serialization
            
            if let JSON = response.result.value {
                let movieData = Mapper<MovieData>().map(JSONString: JSON )
                self.movies = movieData!.data
                self.tableView.reloadData()
            }
        }
    }
    
    // Display customization
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    
    //func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
    //
    //}
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return movies.count
    }
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AlamofireCell", for: indexPath) as! AlamofireCell
        cell.delegate = self
        cell.configure(movie: movies[indexPath.row])
        return cell
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }
    
}
extension AlamofireViewController: AlamofireCellDelegate {
    
    func likeButtonClicked(id: Int) {
//        for index in 0...movies.count-1 {
//            if movies[index].id == id {
//                movies.remove(at: index)
//                break
//            }
//        }
        
        movies = movies.filter( {$0.id != id} )
        tableView.reloadData()
    }
}

protocol AlamofireCellDelegate {
    
    func likeButtonClicked(id: Int)
    
}
