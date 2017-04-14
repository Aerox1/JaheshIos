//
//  PostsViewController.swift
//  Jahesh
//
//  Created by Arash Farahani on 4/13/17.
//  Copyright © 2017 Arash Farahani. All rights reserved.
//

import UIKit

class PostsViewController: UIViewController { // u also can use UITableViewController
    
    var tableView: UITableView!
    var posts = [Post]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView = UITableView()
        tableView.contentInset = .zero
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(PostCell.self, forCellReuseIdentifier: "PostCell")
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
        
        let post = Post()
        post.date = Date()
        //if let image = UIImage(named: "profileImages") {
        // post.image = image
        //} else {
        //    post.image =
        //}

        post.image = UIImage(named: "profileImage") ?? UIImage() // in mosavie chand khat code balas
        
        post.title = "hello world"
        posts.append(post)
        posts.append(post)
        posts.append(post)
        posts.append(post)
        posts.append(post)
        posts.append(post)
        posts.append(post)
    }
    
}
extension PostsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return posts.count
    }
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! PostCell
        cell.configure(post: posts[indexPath.row])
        return cell
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }
    
}
extension PostsViewController: UITableViewDelegate {
    
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
